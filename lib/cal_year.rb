#!/usr/bin/env ruby

class Year

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

print month_full_alpha[$month-1], " ", $year, "\n"
puts days_of_week_header

#exit_with_usage_instructions
#number_of_days

#def number_of_days
    ccyy = $year.to_s
		$yy = (ccyy[2] + ccyy[3]).to_i
	if $month == 9 || $month == 4 || $month == 6 || $month == 11
	  $days = 30
	elsif $month == 2
		$days = 28
      if $year.modulo(4) == 0
      	if $year.modulo(400) == 0 || $yy != 0
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
#    $weeks = [[],[],[],[],[],[]]

# Number of days in this month
    d = $days

#start_day (SUN = 0, MON = 1, TUE = 2, WED = 3, THU = 4, FRI = 5, SAT = 6)
#def zeller_congruence

  if $month == 1 || $month ==2
    $month +=12
    $year -= 1
  end

  k = $year.modulo(100)
  ccyy = $year.to_s
  j = (ccyy[0] + ccyy[1]).to_i

  h = (1 + (13 * ($month + 1)/5) + k + (k/4) + (j/4) +(5*j)).modulo(7)

# adjust for day of week value difference from Zeller to Shoup
  if h >= 1 && h <= 6
    h -= 1
  else
  	h = 6
  end

  $first_day_this_month = h

#  print "$month ", $month, "\n"
#  print "k ", k, "\n"
#  print "j ", j, "\n"
#  print "h ", h, "\n"
#end

# Number of the day of the week and of the first day
    f = $first_day_this_month
# Counter for this day of the month
    y = 1
    line = ""
# Fill empty days at beginning of month, if any (Sunday = 0)
    if $first_day_this_month > 0
      i = 0
      filler = "    "
      while i < $first_day_this_month
#      	print "PreLoadBlankDays ", "  ","i ", i
#        $weeks[0].push(filler)
        line += filler
        i += 1
      end
    end

# "w" is the number of the week from 1 thru 6
    6.times do |w|
      while y <= d
        if y < 10
        	filler = y.to_s + "   "
        else
            filler = y.to_s + "  "
        end
#        $weeks[w].push(filler)
        line += filler
#       print "Each Day ", w, "  ", $weeks[w[f]].inspect
        y += 1
        f += 1
        if f >= 7
          break
        end
      end
# reset the day of the week
      f = 0
#      print $weeks[w], "\n"
      print line, "\n"
      line = ''
      if y > d
      	break
      end
    end
  #end
end
