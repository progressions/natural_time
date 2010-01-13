require 'lib/naturaltime'

puts "Enter number of seconds: "
s = $stdin.gets

puts NaturalTime.new(s.to_i)