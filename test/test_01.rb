require 'minitest/autorun'
require 'rubygems'
require 'bundler/setup'

class TestCalIntegration < Minitest::Test

#Sample test
#  def test_00_that_the_tests_run
#    assert_equal true, true
#  end

#Valid arguments
#  def test_01_zero_args_help_message
#    output = `./cal.rb`
#    expected = <<EOS
#Enter the command and numeric month and year or a year between 1800-3000.
#Format: `./cal.rb MM CCYY`
#EOS
#    assert_equal expected, output
#  end

#Invalid Parms
#  def test_02_year_too_low
#    output = `./cal.rb 01 1751`
#    expected = <<EOS
#Enter the command and numeric month and year or a year between 1800-3000.
#Format: `./cal.rb MM CCYY` or `.cal.rb CCYY`
#EOS
#    assert_equal expected, output
#  end

#Invalid Parms
#  def test_03_year_too_high
#    output = `./cal.rb 01 3001`
#    expected = <<EOS
#Enter the command and numeric month and year or a year between 1800-3000.
#Format: `./cal.rb MM CCYY` or `.cal.rb CCYY`
#EOS
#    assert_equal expected, output
#  end

#Valid arguments needed
#  def test_04a_month_too_high
#    output = `./cal.rb 13 2015`
#    expected = <<EOS
#Enter the command and numeric month and year or a year between 1800-3000.
#Format: `./cal.rb MM CCYY` or `.cal.rb CCYY`
#EOS
#    assert_equal expected, output
#  end

#Valid arguments needed
#  def test_04b_month_too_low
#    output = `./cal.rb 00 2015`
#    expected = <<EOS
#Enter the command and numeric month and year or a year between 1800-3000.
#Format: `./cal.rb MM CCYY` or `.cal.rb CCYY`
#EOS
#    assert_equal expected, output
#  end

#Valid arguments must accompany run command of './cal'
#  def test_05_month_not_numeric
#    output = `./cal.rb xx 1970`
#    expected = <<EOS
#Enter the command and numeric month and year or a year between 1800-3000.
#Format: `./cal.rb MM CCYY` or `.cal.rb CCYY`
#EOS
#    assert_equal expected, output
#  end

#Date validation
#  def test_06_month_missing
#    output = `./cal.rb 1945`
#    expected = <<EOS
#Enter the command and numeric month and year or a year between 1800-3000.
#Format: `./cal.rb MM CCYY` or `.cal.rb CCYY`
#EOS
#    assert_equal expected, output
#  end

#Valid arguments
#  def test_07_year_not_numeric
#    output = `./cal.rb 04 xxxx`
#    expected = <<EOS
#Enter the command and numeric month and year or a year between 1800-3000.
#Format: `./cal.rb MM CCYY` or `.cal.rb CCYY`
#EOS
#    assert_equal expected, output
#  end

#Valid arguments
#  def test_08_year_missing
#    output = `./cal.rb 11`
#    expected = <<EOS
#Enter the command and numeric month and year or a year between 1800-3000.
#Format: `./cal.rb MM CCYY` or `.cal.rb CCYY`
#EOS
#    assert_equal expected, output
#  end

#Valid January 2000
  def test_09_january_2000_six_week_month
    output = `./cal.rb 01 2000`
    expected = <<EOS
January 2000
Sun Mon Tue Wed Thu Fri Sat
                        1
2   3   4   5   6   7   8
9   10  11  12  13  14  15
16  17  18  19  20  21  22
23  24  25  26  27  28  29
30  31
EOS
    assert_equal expected, output
 end

#Valid February 1923
  def test_10_2_february_1923
    output = `./cal.rb 02 1923`
    expected = <<EOS
February 1923
Sun Mon Tue Wed Thu Fri Sat
                1   2   3
4   5   6   7   8   9   10
11  12  13  14  15  16  17
18  19  20  21  22  23  24
25  26  27  28
EOS
    assert_equal expected, output
  end


#Valid March 1862
  def test_11_march_1862
    output = `./cal.rb 03 1862`
    expected = <<EOS
March 1862
Sun Mon Tue Wed Thu Fri Sat
                        1
2   3   4   5   6   7   8
9   10  11  12  13  14  15
16  17  18  19  20  21  22
23  24  25  26  27  28  29
30  31
EOS
    assert_equal expected, output
  end

#Valid April 1912
  def test_12_april_1912
    output = `./cal.rb 04 1912`
    expected = <<EOS
April 1912
Sun Mon Tue Wed Thu Fri Sat
    1   2   3   4   5   6
7   8   9   10  11  12  13
14  15  16  17  18  19  20
21  22  23  24  25  26  27
28  29  30
EOS
    assert_equal expected, output
  end

#Valid May 1945
  def test_13_may_1945
    output = `./cal.rb 05 1945`
    expected = <<EOS
May 1945
Sun Mon Tue Wed Thu Fri Sat
        1   2   3   4   5
6   7   8   9   10  11  12
13  14  15  16  17  18  19
20  21  22  23  24  25  26
27  28  29  30  31
EOS
    assert_equal expected, output
  end

#Valid June 1976
  def test_14_june_1976
    output = `./cal.rb 06 1976`
    expected = <<EOS
June 1976
Sun Mon Tue Wed Thu Fri Sat
        1   2   3   4   5
6   7   8   9   10  11  12
13  14  15  16  17  18  19
20  21  22  23  24  25  26
27  28  29  30
EOS
    assert_equal expected, output
  end

#Valid July 1971
  def test_15_july_1971
    output = `./cal.rb 07 1971`
    expected = <<EOS
July 1971
Sun Mon Tue Wed Thu Fri Sat
                1   2   3
4   5   6   7   8   9   10
11  12  13  14  15  16  17
18  19  20  21  22  23  24
25  26  27  28  29  30  31
EOS
    assert_equal expected, output
  end

#Valid August 1876
  def test_16_august_1876
    output = `./cal.rb 08 1876`
    expected = <<EOS
August 1876
Sun Mon Tue Wed Thu Fri Sat
        1   2   3   4   5
6   7   8   9   10  11  12
13  14  15  16  17  18  19
20  21  22  23  24  25  26
27  28  29  30  31
EOS
    assert_equal expected, output
  end

#Valid September 1939
  def test_17_september_1939
    output = `./cal.rb 09 1939`
    expected = <<EOS
September 1939
Sun Mon Tue Wed Thu Fri Sat
                    1   2
3   4   5   6   7   8   9
10  11  12  13  14  15  16
17  18  19  20  21  22  23
24  25  26  27  28  29  30
EOS
    assert_equal expected, output
  end

#Valid October 1805
  def test_18_october_1805
    output = `./cal.rb 10 1805`
    expected = <<EOS
October 1805
Sun Mon Tue Wed Thu Fri Sat
        1   2   3   4   5
6   7   8   9   10  11  12
13  14  15  16  17  18  19
20  21  22  23  24  25  26
27  28  29  30  31
EOS
    assert_equal expected, output
  end

#Valid November 1918
  def test_19_november_1918
    output = `./cal.rb 11 1918`
    expected = <<EOS
November 1918
Sun Mon Tue Wed Thu Fri Sat
                    1   2
3   4   5   6   7   8   9
10  11  12  13  14  15  16
17  18  19  20  21  22  23
24  25  26  27  28  29  30
EOS
    assert_equal expected, output
  end

#Valid December 1996 Sunday first day of month
  def test_20_december_1996_sunday_first_day
    output = `./cal.rb 12 1996`
    expected = <<EOS
December 1996
Sun Mon Tue Wed Thu Fri Sat
1   2   3   4   5   6   7
8   9   10  11  12  13  14
15  16  17  18  19  20  21
22  23  24  25  26  27  28
29  30  31
EOS
    assert_equal expected, output
  end

#Valid February 2240 Leap Year
  def test_21_february_2240_std_feb_leap_year
    output = `./cal.rb 02 2240`
    expected = <<EOS
February 2440
Sun Mon Tue Wed Thu Fri Sat
            1   2   3   4
5   6   7   8   9   10  11
12  13  14  15  16  17  18
19  20  21  22  23  24  25
26  27  28  29
EOS
    assert_equal expected, output
  end

#Valid Full Standard Year

#Valid Full Year 1900 Centenary Non Leap Year

#Valid Full Year 2000 Centenary Leap Year

end