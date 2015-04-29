#!/usr/bin/env ruby
require_relative 'NumberOfDays'

$month_full_alpha = [
  "January  ",
  "February ",
  "March    ",
  "April    ",
  "May      ",
  "June     ",
  "July     ",
  "August   ",
  "September",
  "October  ",
  "November ",
  "December "]

$dow_header = "Su Mo Tu We Th Fr Sa "


#run parameters = ARGV
$month = ARGV[0].to_i
$year = ARGV[1].to_i

#Test for valid month and year parms

  if ($month < 1 or $month > 12) || ($year < 1800 or $year > 3000)
    puts "Enter the command and numeric month (no leading zero) and year between 1800-3000.
Format: `ruby cal.rb MM CCYY`"
    return
  end

class Month

print $month_full_alpha[$month-1], " ", $year, "\n"
puts $dow_header

# Number of days in this month
    d = NumberOfDays.new($month, $year).days

#start_day (SUN = 0, MON = 1, TUE = 2, WED = 3, THU = 4, FRI = 5, SAT = 6)

# zeller_congruence
# Number of the day of the week and of the first day
    f = NumberOfDays.new($month, $year).zeller

# Counter for this day of the month
    y = 1
    line = ""
# Fill empty days at beginning of month, if any (Sunday = 0)
    if f > 0
      i = 0
      filler = "   "
      while i < f
# PreLoadBlankDays
        line += filler
        i += 1
      end
    end

# Generate weeks from 1 - 6

    6.times do
      while y <= d
        if y < 10
        	filler = y.to_s + "  "
        else
          filler = y.to_s + " "
        end

        line += filler

        y += 1
        f += 1
        if f >= 7
          break
        end
      end
# reset the day of the week
      f = 0
# print calendar week line
      print line, "\n"
      line = ''
      if y > d
      	break
      end
    end

end
#######################################################