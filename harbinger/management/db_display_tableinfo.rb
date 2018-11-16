#!/usr/bin/ruby

begin
  require 'rubygems'
  require 'pg'
rescue
  print "Unable to pass the requires"
  exit 2
end

begin
  p = PGconn.new(:user => 'harbinger',:host => 'localhost')
rescue
  print "Unable to connect to postgres"
  exit 2
end

tables = p.exec("SELECT tablename from pg_tables where tablename like 'data_manager%' order by tablename")
tables.each do |table|
  tablename = table['tablename']
  case tablename
    when /data_manager_warehouse_logs_/
      query_table = p.exec("select id, updated_at from #{tablename} order by id limit 1")
      if query_table.num_tuples > 0
        table_info = query_table.first
        puts "#{tablename},\tLowest ID: #{table_info['id']},\tDated: #{table_info['updated_at']}"
      else
        puts "#{tablename} is empty"
      end
    when /data_manager_message_logs_/
      query_table = p.exec("select id, handle_message_begin from #{tablename} order by id limit 1")
      if query_table.num_tuples > 0
        table_info = query_table.first
        puts "#{tablename},\tLowest ID: #{table_info['id']},\tDated: #{table_info['handle_message_begin']}"
      else
        puts "#{tablename} is empty"
      end
    when /data_manager_error_logs_/
      ## here for when error_logs get to be a problem
      #query_table = p.exec("select id, created_at from #{tablename} order by id limit 1")
      #if query_table.num_tuples > 0
      #  table_info = query_table.first
      #  puts "#{tablename},\tLowest ID: #{table_info['id']},\tDated: #{table_info['created_at']}"
      #else
      #  puts "#{tablename} is empty"
      #end
  end
end
