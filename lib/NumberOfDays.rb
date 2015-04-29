class NumberOfDays

  def initialize(month, year)
      @month = month.to_i
      @year = year.to_i
      @days = 0
  end

  def days
    if @month == 9 || @month == 4 || @month == 6 || @month == 11
      @days = 30
    elsif @month == 2
      ccyy = @year.to_s
      yy = (ccyy[2] + ccyy[3]).to_i
      @days = 28
        if @year.modulo(4) == 0
          if @year.modulo(400) == 0 || yy != 0
          @days = 29
          end
        end
    else @days = 31
    end

    return @days
  end

#Zeller Congruence
  def zeller

    tyear = @year
    if @month == 1 || @month ==2
       @month +=12
       tyear = @year - 1
    end

    k = tyear.modulo(100)
    ccyy = tyear.to_s
    j = (ccyy[0] + ccyy[1]).to_i

    @h = (1 + (13 * (@month + 1)/5) + k + (k/4) + (j/4) +(5*j)).modulo(7)

# adjust for day of week value difference from Zeller to Shoup

    if @h >= 1 && @h <= 6
      @h -= 1
    else
      @h = 6
    end

    return @h
  end

end