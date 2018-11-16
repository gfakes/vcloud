#!/usr/bin/ruby

begin
  require 'rubygems'
  require 'pg'
  require 'date'
  require 'time'
  require 'logger'
rescue e
  print "Unable to require #{e}"
  exit 2
end

begin
  p = PGconn.new(:user => 'harbinger',:host => 'localhost')
rescue
  print "Unable to connect to postgres"
  exit 2
end

logger = Logger.new('/servers/harbinger/logs/bridge-service.log')
logger.level = Logger::INFO

date_90_days_ago = (Date.today - 90 ).to_s

logger.info "DB_Cleanup: Cleaning up message and warehouse logs through #{date_90_days_ago}"

tables = p.exec("SELECT tablename from pg_tables where tablename like 'data_manager_message_logs_%' order by tablename")
tables.each do |table|
  tablename = table['tablename']
  query_table = p.exec("select id, to_char(handle_message_begin, 'YYYY-MM-DD') as mindate from #{tablename} order by id limit 1")
  if query_table.num_tuples > 0
    table_info = query_table.first
    if Time.at(Time.parse(table_info['mindate'].to_s)) > Time.at(Time.parse(date_90_days_ago))
      logger.info "DB_Cleanup: Found #{tablename},\tLowest ID: #{table_info['id']},\tDated: #{table_info['mindate']}"
      @min_dmml_table = tablename
      @min_dmml_id = table_info['id']
      break
    end
  end
end


@dmml_partition_num = @min_dmml_table.split('_').last.to_i
logger.info "DB_Cleanup: Removing message logs up to partition number: #{@dmml_partition_num}"
(0..(@dmml_partition_num - 1)).each do |partition_num|
 logger.debug "DB_Cleanup: truncate data_manager_message_logs_#{partition_num.to_s.rjust(5, '0')};"
  begin
     t = p.exec("truncate data_manager_message_logs_#{partition_num.to_s.rjust(5, '0')}")
  rescue
     logger.debug "DB_Cleanup: Error truncating data_manager_message_logs_#{partition_num.to_s.rjust(5, '0')}"
  end
end

#can't look for min_dmml_id because it may not have any operations, as my test case proved.

tables = p.exec("SELECT tablename from pg_tables where tablename like 'data_manager_warehouse_logs_%' order by tablename")
tables.each do |table|
  tablename = table['tablename']
  query_table = p.exec("select id, data_manager_message_log_id from #{tablename} order by id limit 1")
  if query_table.num_tuples > 0
    table_info = query_table.first
    if table_info['data_manager_message_log_id'].to_i > @min_dmml_id.to_i
      logger.info "DB_Cleanup: Found #{tablename},\tLowest ID: #{table_info['id']},\tMin DMML_ID: #{table_info['data_manager_message_log_id']}"
      @min_dmwl_table = tablename
      break
    end
  end
end

@dmwl_partition_num = @min_dmwl_table.split('_').last.to_i
logger.info "DB_Cleanup: Removing warehouse logs up to partition number: #{@dmwl_partition_num}"
(0..(@dmwl_partition_num - 1)).each do |partition_num|
 logger.debug "DB_Cleanup: truncate data_manager_warehouse_logs_#{partition_num.to_s.rjust(5, '0')};"
 begin
   p.exec("truncate data_manager_warehouse_logs_#{partition_num.to_s.rjust(5, '0')}")
 rescue
   logger.debug "DB_Cleanup: Error truncating data_manager_warehouse_logs_#{partition_num.to_s.rjust(5, '0')}"
 end
end
