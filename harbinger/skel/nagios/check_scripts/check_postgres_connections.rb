#!/usr/bin/ruby

begin
  require 'rubygems'
  require 'pg'
rescue
  print "Unable to pass the requires"
  exit 2
end

begin
  p = PGconn.new(:user => 'postgres')
rescue
  print "Unable to connect to postgres"
  exit 2
end

res = p.exec('select sum(numbackends)  as conn_count  from pg_stat_database')
connections = res.first['conn_count']

res = p.exec('show max_connections')
max =  res.first['max_connections']

percent = connections.to_f / max.to_f

if percent.to_f > 0.9
  print "Connections exceed 90% of max connections (#{connections} / #{max})"
  `netstat -anp > /tmp/nagios_netstat_log_#{timestamp}`
  `ps -ef > /tmp/nagios_ps_log_#{timestamp}`
  `top -b -n1 > /tmp/nagios_top_log_#{timestamp}`
  p.close
  exit 2
else
  print "Connection count is within limits. #{connections} out of #{max}."
  p.close
end
