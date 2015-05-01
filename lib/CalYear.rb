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

    12.times do |mm|
      month = mm +1
      @mmonth = CalMonth.new(month, @year)
      @yyear << @mmonth.to_s
    end
    @yyear
  end

end # End of Year Class