#!/usr/bin/ruby

begin
  require 'rubygems'
  require 'pg'
rescue
  print "Unable to pass the requires"
  exit 2
end

begin
  p = PGconn.new(:user => 'mirth',:dbname => 'mirthdb')
rescue
  print "Unable to connect to mirthdb"
  exit 2
end

queue_limit = 1000
queues = p.exec('select c.name as Name, queued from channel c, channel_statistics cs where cs.channel_id = c.id')
queues.each do |queue|
  if queue['queued'].to_i > queue_limit
    print "#{queue['name']} has #{queue['queued']} messages."
    exit 2
  end
end

print "Mirth queues all less than #{queue_limit}."
p.close
