#!/usr/bin/env ruby

require_relative 'CalMonth'
require_relative 'CalYear'

#run parameters = ARGV

if ARGV.length == 2

@month = ARGV[0].to_i
@year = ARGV[1].to_i

#Test for valid month and year parms

  if (@month < 1 or @month > 12) || (@year < 1800 or @year > 3000)
    puts "Enter the command and numeric month and year between 1800-3000.
          Format: `ruby cal.rb MM CCYY`"
  else
    mmonth = CalMonth.new(@month, @year)
    puts mmonth.to_s
  end

elsif ARGV.length == 1

  @year = ARGV[0].to_i

  if (@year < 1800 or @year > 3000)
    puts "Enter the command and year between 1800-3000.
          Format: `ruby cal.rb CCYY`"
  else
    yyear = CalYear.new(@year)
    puts "#{@year} \n".center(66)
    puts yyear.to_s
  end

else

  puts "Enter the command and month and year or year alone."

end