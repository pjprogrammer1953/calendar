require_relative 'NumberOfDays'
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

$dow_header = "Su Mo Tu We Th Fr Sa  "

#Test for valid month and year parms
$year = ARGV[0].to_i

  if ($year < 1800 or $year > 3000)
    puts "Enter the command and year between 1800-3000.
Format: `ruby cal_year.rb CCYY`"
    return
  end


class Year

print $year, "\n"

# Fill $start_day array with 12 start days
#def start_day()

  $days_in_month = []
  $start_day = []

12.times do |mm|

    month = mm + 1

# Number of days in this month
    d = NumberOfDays.new(month, $year).days
    $days_in_month.push(d)

#def zeller_congruence - find start day of all 12 months
    h = NumberOfDays.new(month, $year).zeller
    $start_day.push(h)

end

end # End of Year Class
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
    filler4 = "   "

# Fill empty days at beginning of 1st month, if any (Sunday = 0)
    if f0 > 0
      j0 = 0
      while j0 < f0
        line0 += filler4
        j0 += 1
      end
    end

    # Fill empty days at beginning of 2nd month, if any (Sunday = 0)
    if f1 > 0
      j1 = 0
      while j1 < f1
        line1 += filler4
        j1 += 1
      end
    end

    # Fill empty days at beginning of 3rd month, if any (Sunday = 0)
    if f2 > 0
      j2 = 0
      while j2 < f2
        line2 += filler4
        j2 += 1
      end
    end

# compose & print weeks 1 - 6
    d0 = $days_in_month[i0]
    d1 = $days_in_month[i1]
    d2 = $days_in_month[i2]
    6.times do
##############
      7.times do
        if y0 > d0
          filler0 = filler4
        else
          if y0 < 10
        	  filler0 = y0.to_s + "  "
          else
            filler0 = y0.to_s + " "
          end
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
      7.times do
        if y1 > d1
          filler1 = filler4
        else
          if y1 < 10
            filler1 = y1.to_s + "  "
          else
            filler1 = y1.to_s + " "
          end
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
      7.times do
        if y2 > d2
          filler2 = filler4
        else
          if y2 < 10
            filler2 = y2.to_s + "  "
          else
            filler2 = y2.to_s + " "
          end
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
      print line0, " ",line1, " ",line2, "\n"
      line0 = ''
      line1 = ''
      line2 = ''
    end # end of 6.times do loop printing each week line

  end #end of method print_days

4.times do |mm|
    xx = mm * 3
    print "      ", $month_full_alpha[xx], "             "
    print $month_full_alpha[xx + 1], "             "
    print $month_full_alpha[xx + 2], "\n"
    print $dow_header, $dow_header, $dow_header, "\n"
    print_days (xx)
  end