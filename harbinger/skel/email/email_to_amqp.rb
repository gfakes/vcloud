#!/usr/bin/ruby
require 'rubygems'
require 'tmail'
require 'json'
require 'bunny'

CONFIG_FILE="/servers/harbinger/config/site.config.json"

@email = STDIN.read

emp = TMail::Mail.parse(@email)

hash = Hash.new

hash["to"] = emp.to
hash["date"] = emp.date
hash["body"] = emp.body
hash["subject"] = emp.subject
hash["from"] = emp.from
hash["app-name"] = emp.to.first.split("@").first


puts JSON.generate(hash)

  boptions = JSON.parse(File.open(CONFIG_FILE).read)
  b = Bunny.new(
	:host => boptions["amqp-apps"]["host"],
	:vhost => boptions["amqp-apps"]["vhost"],
	:user => boptions["amqp-apps"]["user"],
	:pass => boptions["amqp-apps"]["pass"])
  b.start
  exchange = b.exchange("mail", :type => :topic, :durable => true)
  exchange.publish(JSON.generate(hash), :key => hash["app-name"])
  b.stop


