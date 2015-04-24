#!/usr/bin/env ruby

#require 'date'

class Month

args = ARGV

def exit_with_usage_instructions
  puts <<EOS
Enter the command and numeric month and year between 1800-3000.
Format: `./cal.rb MM CCYY`
EOS
  exit
end


exit_with_usage_instructions if ARGV.empty?

month = ARGV[0]
year = ARGV[1]

puts "Month Class"
end