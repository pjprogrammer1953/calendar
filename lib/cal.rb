#!/usr/bin/env ruby

class Month

month_full_alpha = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
days_of_week_header = ["Sun Mon Tue Wed Thu Fri Sat "]

#args = ARGV
$month = ARGV[0].to_i
$year = ARGV[1].to_i

def exit_with_usage_instructions
  puts <<EOS
Enter the command and numeric month and year between 1800-3000.
Format: `./cal.rb MM CCYY`
EOS
#  exit
end

#test month
#$month = 7

#test year
#$year = 1971

print month_full_alpha[$month-1], " ", $year, "\n"
puts days_of_week_header

#exit_with_usage_instructions
#number_of_days

#def number_of_days
    ccyy = $year.to_s
		yy = (ccyy[2] + ccyy[3]).to_i
	if $month == 9 || $month == 4 || $month == 6 || $month == 11
	  $days = 30
	elsif $month == 2
		$days = 28
      if $year.modulo(4) == 0
      	if $year.modulo(400) == 0 || yy != 0
      	$days = 29
        end
      end
    else $days = 31
    end
#end
#puts "yy", yy, "  ", (yy.modulo(4)), "\n"
#puts "ccyy", ccyy, "  ", ($year.modulo(4)), "\n"
#puts "Number of days", $days, "\n"

#def start_day
    $weeks = [[],[],[],[],[],[]]
#puts weeks.inspect
# Number of days in this month
    d = $days
#start_day (SUN = 0, MON = 1, TUE = 2, WED = 3, THU = 4, FRI = 5, SAT = 6)
$first_day_this_month = 6 # from zeller method
# Number of the day of the week and of the first day
    f = $first_day_this_month
# Counter for this day of the month
    y = 1
# "w" is the number of the week from 1 thru 6
    6.times do |w|
      while y <= d
        if y < 10
        	filler = y.to_s + "   "
        else
            filler = y.to_s + "  "
        end
        $weeks[w].push(filler)
#       print "Each Day ", w, "  ", $weeks[w[f]].inspect
        y += 1
        f += 1
        if f >= 7
          break
        end
      end
      f = 0  #reset the day of the week
      print $weeks[w], "\n"
      if y > d
      	break
      end
#      print "Week after ", w, "  ", $weeks[w].inspect, "\n"
    end
  #end
end
