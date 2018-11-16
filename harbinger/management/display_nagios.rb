#!/usr/bin/ruby

require 'rubygems'
require 'nagios_parser/status/parser'

STATUS = ["OK","WARNING", "CRITICAL"]
FILENAME = "/var/cache/nagios3/status.dat"

status = File.read(FILENAME)
data = NagiosParser::Status::Parser.parse(status)

file_time = File.mtime(FILENAME)
puts "Updated - #{file_time}"
if (Time.now.to_i - file_time.to_i) > 1800  #30.minutes.ago
  puts "CRITICAL - NAGIOS has not updated the file in the last 30 minutes"
end

puts "Hosts:"
data["hoststatus"].each { |h| puts "#{STATUS[h['current_state']]} - #{h['host_name']} #{h['plugin_output'] unless h['current_state'] == 0}" }
puts "Services:"
data["servicestatus"].each { |s| puts "#{STATUS[s['current_state']]} - #{s['service_description']} #{s['plugin_output'] unless s['current_state'] == 0}" }


