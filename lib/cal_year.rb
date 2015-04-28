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

    $days_in_month.push(days)

end

# Display Days in month for validation
    print "\n" "Days in month: "
    puts $days_in_month.inspect

#start_day (SUN = 0, MON = 1, TUE = 2, WED = 3, THU = 4, FRI = 5, SAT = 6)
#def zeller_congruence - find start day of all 12 months

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

#Display start day of each month for validation
print "Start day of month: "
puts $start_day.inspect

end # End of YEar Class
########################################################
def print_days (i)

# Number of the day of the week and of the first day
     i0 = i
     f0 = $start_day[i0]
     i1 = i + 1
     f1 = $start_day[i1]
     i2 = i + 2
     f2 = $start_day[i2]

# Counter for this day of the month
    y0 = 1
    y1 = 1
    y2 = 1

# Clear all three line portions
    line0 = ""
    line1 = ""
    line2 = ""
    filler4 = "    "

# Fill empty days at beginning of 1st month, if any (Sunday = 0)
    if f0 > 0
      i0 = 0
      while i0 < f0
        line0 += filler4
        i0 += 1
      end
    end

    # Fill empty days at beginning of 2nd month, if any (Sunday = 0)
    if f1 > 0
      i1 = 0
      while i1 < f1
        line1 += filler4
        i1 += 1
      end
    end

    # Fill empty days at beginning of 3rd month, if any (Sunday = 0)
    if f2 > 0
      i2 = 0
      while i2 < f2
        line2 += filler4
        i2 += 1
      end
    end

# compose & print weeks 1 - 6
    d0 = $days_in_month[i0]
    d1 = $days_in_month[i1]
    d2 = $days_in_month[i2]
    6.times do
##############
      while y0 <= d0
        if y0 < 10
        	filler0 = y0.to_s + "   "
        else
          filler0 = y0.to_s + "  "
        end
    # append filler field to line & increment counter
        line0 += filler0
        y0 += 1
        f0 += 1
        if f0 >= 7
          break
        end
      end
##############
      while y1 <= d1
        if y1 < 10
          filler1 = y1.to_s + "   "
        else
          filler1 = y1.to_s + "  "
        end
    # append filler field to line & increment counter
        line1 += filler1
        y1 += 1
        f1 += 1
        if f1 >= 7
          break
        end
      end
##############
      while y2 <= d2
        if y2 < 10
          filler2 = y2.to_s + "   "
        else
          filler2 = y2.to_s + "  "
        end
    # append filler field to line & increment counter
        line2 += filler2
        y2 += 1
        f2 += 1
        if f2 >= 7
          break
        end
      end
##############
     # reset the day of the week
      f0 = 0
      f1 = 0
      f2 = 0
     #      print week line for 3 months
      print line0, line1, line2, "\n"
      line0 = ''
      line1 = ''
      line2 = ''
#      if y0 > d0
#      	break
#      end
    end # end of 6.times do loop printing each week line

  end #end of method print_days

4.times do |mm|
    xx = mm * 3
    print $month_full_alpha[xx], '                   '
    print $month_full_alpha[xx + 1], '                   '
    print $month_full_alpha[xx + 2], "\n"
    print $dow_header, $dow_header, $dow_header, "\n"
    print_days (xx)
  end