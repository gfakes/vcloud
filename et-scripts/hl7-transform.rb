#!/usr/bin/ruby
# This script transforms the data from the hl7 sources and transforms
# it to fit typographical and site specific conventions

require 'rubygems'
require 'json'
require 'time'

def convention_transformer(hash,config)

  if !hash["transaction_date_time"].nil? and !hash["exam_status"].nil?
    case hash["exam_status"]
      when "S"
        hash["schedule_event_time"] = hash["transaction_date_time"]
      when "IP"
        hash["sign_in_time"] = hash["transaction_date_time"]
      when "BE"
        hash["begin_exam_event_time"] = hash["transaction_date_time"]
      when "C"
        hash["end_exam_event_time"] = hash["transaction_date_time"]
    end
  end

  patient_type = hash["patient_type"]
  site = hash["site"]

  if !patient_type.nil?
    hash["site_class"] = "#{patient_type} #{site}"  unless hash["site"].nil?
    hash["site_class_name"] = "#{patient_type} #{site}"  unless hash["site"].nil?
  end

  if patient_type == "E"
    hash["site_class_ed"] = true unless hash["site"].nil?
  end

  if not ["I","O","E"].include?(hash["patient_type"])
    hash["patient_type"] = "O"
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
