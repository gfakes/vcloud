#!/usr/bin/ruby
msg = ''
filename = ARGV[0]
if filename.nil?
	puts "Error: you need to supply a filename"
	puts "Usage: rhl7.rb <file_with_single_hl7_message>"
        puts "Example: rhl7.rb acc1.hl7 > acc1.hl7.parsed"
        exit 2
end
if File.exist?(filename)
  file = File.open(filename).read
  file.each_line do |line|
    msg << line
  end
else
  puts "'#{filename}' does not exist"
  exit 2
end

$field_delim = msg.slice(3,1)
$component_delim = msg.slice(4,1)
$repeat_delim = msg.slice(5,1)
$escape_delim = msg.slice(6,1)
$sub_component_delim = msg.slice(7,1)

def print_component(str,field_str)
  str_split = str.split($component_delim)
  if str_split.size > 1 and !(str.slice($repeat_delim))
    lines = "\n"
    str_split.each_index do |comp_indx|
      lines += "\t\t#{field_str}.#{comp_indx + 1}: #{str_split[comp_indx]} \n"
    end
    return lines
  else
    return str
  end
end

msg.lines.each do |line|
  line_split = line.split($field_delim)
  line_split.each_index do |field|
    field_str = "#{line_split[0]}.#{line_split[0] == 'MSH' ? field + 1 : field}"
    puts "#{field_str}: #{print_component(line_split[field], field_str)}" unless line_split[field].empty?
    field_split = line_split[field].split($repeat_delim)
    if field_split.size > 1 and line_split[0] != 'MSH'
      field_split.each_index do |repeating|
          puts "\trepeating-#{repeating + 1} #{field_str}:#{print_component(field_split[repeating], field_str)}"
      end
    end
  end
end
