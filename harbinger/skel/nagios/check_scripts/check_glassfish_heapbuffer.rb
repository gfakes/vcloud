#!/usr/bin/ruby

begin
 server_log = File.read("/servers/harbinger/logs/glassfish/server.log")
rescue
 print "Unable to open glassfish server.log"
 exit 2
end


if server_log.include?("HeapByteBuffer")
  print "HeapByteBuffer condition, restart glassfish"
  exit 2
else
  print "HeapByteBuffer condition not found."
end
