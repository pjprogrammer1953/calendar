#!/usr/bin/env ruby

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

$dow_header = "Sun Mon Tue Wed Thu Fri Sat "

class Year
$year = ARGV[0].to_i
print $year

# Fill $start_day array with 12 start days
#def start_day()

  $days_in_month = []
  $start_day = []

12.times do |mm|

    month = mm + 1

# Number of days in this month

  if month == 9 || month == 4 || month == 6 || month == 11
    days = 30
  elsif month == 2
    ccyy = $year.to_s
    yy = (ccyy[2] + ccyy[3]).to_i
    days = 28
      if $year.modulo(4) == 0
        if $year.modulo(400) == 0 || yy != 0
        days = 29
        end
      end
  else days = 31
  end

    @@d = days
    $days_in_month.push(@@d)

end

#start_day (SUN = 0, MON = 1, TUE = 2, WED = 3, THU = 4, FRI = 5, SAT = 6)
#def zeller_congruence - find start day of all 12 months

    print "\n" "Days in month: "
    puts $days_in_month.inspect

12.times do |mm|

     @month = mm + 1
     @tyear = $year
  if @month == 1 || @month ==2
     @month +=12
     @tyear = $year - 1
  end

#Zeller Congruence
  k = @tyear.modulo(100)
  ccyy = @tyear.to_s
  j = (ccyy[0] + ccyy[1]).to_i

  h = (1 + (13 * (@month + 1)/5) + k + (k/4) + (j/4) +(5*j)).modulo(7)

# adjust for day of week value difference from Zeller to Shoup

  if h >= 1 && h <= 6
    h -= 1
  else
  	h = 6
  end

  $start_day.push(h)

 end # end of number of days loop

print "Start day of month: "
puts $start_day.inspect



end
########################################################
def print_days (i)
# Number of the day of the week and of the first day
     i = 0
    @ff = $start_day[i]
# Counter for this day of the month
    y = 1
    line = ""
# Fill empty days at beginning of month, if any (Sunday = 0)
    if @ff > 0
      i = 0
      filler = "    "
      while i < @ff
#      	print "PreLoadBlankDays ", "  ","i ", i
#        @@weeks[0].push(filler)
        line += filler
        i += 1
      end
    end

# "w" is the number of the week from 1 thru 6
    @dd = $days_in_month[i]
    6.times do |w|
      while y <= @dd
        if y < 10
        	filler = y.to_s + "   "
        else
            filler = y.to_s + "  "
        end
     #        @@weeks[w].push(filler)
        line += filler
     #       print "Each Day ", w, "  ", @@weeks[w[f]].inspect
        y += 1
        @ff += 1
        if @ff >= 7
          break
        end
      end
     # reset the day of the week
      @ff = 0
     #      print @@weeks[w], "\n"
      print line, "\n"
      line = ''
      if y > @dd
      	break
      end
    end
  end

4.times do |mm|
    xx = mm * 3
    puts puts "\n"
    print $month_full_alpha[xx], '                   '
    print $month_full_alpha[xx + 1], '                   '
    print $month_full_alpha[xx + 2], "\n"
    print $dow_header, $dow_header, $dow_header, "\n"
    print_days (mm)
  end