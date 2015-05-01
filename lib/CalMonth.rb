#!/usr/bin/env ruby
require_relative 'NumberOfDays'

class CalMonth

def initialize(month, year)
  @month = month.to_i
  @year = year.to_i

  @month_full_alpha = [
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

  @dow_header = "Su Mo Tu We Th Fr Sa \n"

  @month_head = "#{@month_full_alpha[@month-1]} #{@year} \n"

# Number of days in this month
  @d = NumberOfDays.new(@month, @year).days

#start_day (SUN = 0, MON = 1, TUE = 2, WED = 3, THU = 4, FRI = 5, SAT = 6)

# zeller_congruence
# Number of the day of the week and of the first day
  @f = NumberOfDays.new(@month, @year).zeller

end

def to_s

# Counter for this day of the month
    y = 1
    line = ""
# Fill empty days at beginning of month, if any (Sunday = 0)
    if @f > 0
      i = 0
      filler = "   "
      while i < @f
# PreLoadBlankDays
        line += filler
        i += 1
      end
    end

# Generate weeks from 1 - 6

    @xx = ''
    @xx << @month_head << @dow_header

    6.times do
      while y <= @d
        if y < 10
        	filler = y.to_s + "  "
        else
          filler = y.to_s + " "
        end

        line += filler

        y += 1
        @f += 1
        if @f >= 7
          break
        end
      end
# reset the day of the week
      @f = 0
# print calendar week line

      @xx << line << "\n"
      line = ''
      if y > @d
      	break
      end
    end
  return @xx
  end
end
#######################################################