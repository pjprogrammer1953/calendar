require_relative 'NumberOfDays'
#!/usr/bin/env ruby

class CalYear
  attr_reader :year

  def initialize(year)
    @year = year.to_i
    @yyear = ""
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
      @yyear.clear
      @array_weeks = Array.new
    12.times do |mm|
      month = mm + 1
      @mmonth = CalMonth.new(month, @year)
#      @yyear << @mmonth.to_s
      @array_weeks.push(@mmonth.to_s)
    end

    4.times do |mm|
      m0 = (3 * mm)
      m1 = (3 * mm) + 1
      m2 = (3 * mm) + 2

# remove carriage return for first two months
# retain it for the third month
      @array_weeks[m0].gsub!("\n", " ")
 #     @year << @array_weeks[m0] << "\n"
      @array_weeks[m1].gsub!("\n", " ")
 #     @year << @array_weeks[m1] << "\n"
      @array_weeks[m2].gsub!("\n", " ")
 #     @year << @array_weeks[m2] << "\n"

 #     @line0 = "x0 = " + x0.length.to_s + "\n"
 #       @yyear << @line0.to_s
 #     @line1 = "x1 = " + x1.length.to_s + "\n"
 #       @yyear << @line1.to_s
 #     @line2 = "x2 = " + x2.length.to_s + "\n"
 #       @yyear << @line2.to_s

 #     @yyear << "x0= \n" + x0.to_s + "\n"
 #     @yyear << "x1= \n" + x1.to_s + "\n"
 #     @yyear << "x2= \n" + x2.to_s + "\n"

#      @line0 = "@array_weeks[m0] = " + @array_weeks[m0].length.to_s + "\n"
#        @yyear << @line0.to_s
#      @line1 = "@array_weeks[m1] = " + @array_weeks[m1].length.to_s + "\n"
#        @yyear << @line1.to_s
#      @line2 = "@array_weeks[m2] = " + @array_weeks[m1].length.to_s + "\n"
#        @yyear << @line2.to_s

      8.times do |i|
        j = i * 22
        string00 = @array_weeks[m0].byteslice(j,22)
        string01 = @array_weeks[m1].byteslice(j,22)
        string02 = @array_weeks[m2].byteslice(j,22)

        @linex = string00.to_s + " " +  string01.to_s + " " + string02.to_s + "\n"
 #       @line0 = string00.to_s
 #       @yyear << @line0.to_s

 #       @line1 = string01.to_s
 #       @yyear << @line1.to_s

#        @line2 = string02.to_s
        @yyear << @linex
      end

    end
   @yyear  # return string to main program for printing
  end
########################################################

end # End of Year Class