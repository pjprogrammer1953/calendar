require_relative 'NumberOfDays'
#!/usr/bin/env ruby

class CalYear
  attr_reader :year

  def initialize(year)
    @year = year.to_i
    @yyear = ''
  end

  def preload

# Fill $start_day array with 12 start days

    @days_in_month = []
    @start_day = []

    12.times do |mm|

      month = mm + 1

# Determine number of days x 12 months
      d = NumberOfDays.new(month, @year).days
      @days_in_month.push(d)

# zeller_congruence - find start day x 12 months
      h = NumberOfDays.new(month, @year).zeller
      @start_day.push(h)

    end
  end

########################################################

  def to_s
      @array_weeks = Array.new
    12.times do |mm|
      month = mm + 1
      @mmonth = CalMonth.new(month, @year)
      @yyear << @mmonth.to_s
      @array_weeks.push(@mmonth.to_s)
    end

    4.times do |mm|
      m0 = 3 * mm
      m1 = 3 * mm + 1
      m2 = 3 * mm + 2

      string00 = @array_weeks[m0].sub("\n", "")
      string01 = @array_weeks[m1].sub("\n", "")
      string02 = @array_weeks[m2].sub("\n", "")

      8.times do |i|
        @line = string00.slice(i * 20, 20) + "  " +
                string01.slice(i * 20, 20) + "  " +
                string02.slice(i * 20, 20) + "\n"
        @yyear << @line.to_s
      end
    end
   @yyear

  end
########################################################

end # End of Year Class