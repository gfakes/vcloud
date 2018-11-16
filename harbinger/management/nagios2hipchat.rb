#!/usr/bin/ruby1.9.3
# sudo gem1.9.3 install hipchat
# usage: echo "message to send" | nagios2hipchat.rb
# requires site.config.json to have hipchat configuration

require 'hipchat'
require 'json'
 
#config = JSON.parse(File.read(ARGV[0]))
config = JSON.parse(File.read("/servers/harbinger/config/site.config.json"))
token = config["nagios"]["hipchat-token"]
room = config["nagios"]["hipchat-room"]
message = STDIN.read

#set the color
case message
	when /RECOVERY/
		color = "green"
	when /WARNING/
		color = "yellow"
	when /healthchecker/
		color = "yellow"
	else
		color = "red"
end

#send to hipchat
client = HipChat::Client.new(token, :api_version => 'v1')
client[room].send('Nagios', message, :notify => true, :color => color, :message_format => 'text')
