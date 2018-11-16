#!/usr/bin/ruby
# This script transforms the data from the hl7 sources and transforms
# it to fit typographical and site specific conventions

require 'rubygems'
require 'json'
require 'time'

def convention_transformer(hash,config)

  #convert appointment duration from minites to seconds
  if !hash["sch_9"].nil? and !hash["sch_10"].nil?
    hash["appointment_duration"] = Integer(hash["sch_9"]) * 60 if hash["sch_10"] == "minute(s)"
  end

  if !hash["transaction_date_time"].nil? and !hash["order_status"].nil?
    case hash["order_status"]
      when "APPOINTMENT"
        hash["schedule_event_time"] = hash["transaction_date_time"]
      when "CANCELED"
        hash["cancelled_event"] = hash["transaction_date_time"]
      when "CHECKED IN"
        hash["sign_in_time"] = hash["transaction_date_time"]
        hash["check_in_time"] = hash["transaction_date_time"]
      when "CONFIRMED"
      when "NOSHOW"
      when "RESCHEDULED"
    end
  end

  site = hash["site"]
  if site.nil?
    site = hash["site"] = "Unknown"
  end

  patient_type = hash["patient_type"]

  if !patient_type.nil?
    hash["site_class"] = "#{patient_type} #{site}"  unless hash["site"].nil?
    hash["site_class_name"] = "#{patient_type} #{site}"  unless hash["site"].nil?
  end

  if patient_type == "E"
    hash["site_class_ed"] = true unless hash["site"].nil?
  end

  if not ["I","O"].include?(hash["patient_type"])
    hash["patient_type"] = "O" unless hash["patient_type"].nil?
  end

  #remove the nils
  hash.each do |key,value|
    if !value.nil?
      if value.to_s.empty?
        hash[key] = nil
      end
      if value.to_s == "\"\""
        hash[key] = nil
      end
    end
  end

  return hash
end

config = JSON.parse(File.read(ARGV[0]))
length = ARGV[1]
payload = STDIN.read(length.to_i)

# Create a ruby hash from the json payload
hash = JSON.parse(payload)
hash = convention_transformer(hash,config)
puts JSON.generate({:variables => hash, :payload => hash})
