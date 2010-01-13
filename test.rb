require 'lib/natural_time'

puts "Enter number of seconds: "
s = $stdin.gets

puts NaturalTime.new(s.to_i)