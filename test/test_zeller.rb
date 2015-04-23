require 'helper'

class TestZellerIntegration < Minitest::Test

#Sample test
  def test_00_that_the_tests_run
    assert_equal true, true
  end

#Valid arguments
  def test_01_zero_args_help_message
    output = `./zeller.rb`
    expected = <<EOS
Enter the command and numeric month and year or a year between 1800-3000.
Format: `./zeller.rb MM CCYY` or `.zeller.rb CCYY`
EOS
    assert_equal expected, output
  end

#Invalid Parms
  def test_02_year_too_low
    output = `./zeller.rb 1751`
    expected = <<EOS
Enter the command and numeric month and year or a year between 1800-3000.
Format: `./zeller.rb MM CCYY` or `.zeller.rb CCYY`
EOS
    assert_equal expected, output
  end

#Invalid Parms
  def test_03_year_too_high
    output = `./zeller.rb 3001`
    expected = <<EOS
Enter the command and numeric month and year or a year between 1800-3000.
Format: `./zeller.rb MM CCYY` or `.zeller.rb CCYY`
EOS
    assert_equal expected, output
  end

#Valid arguments needed
  def test_04_month_too_high_or_too_low
    output = `./zeller.rb 13 2015`
    expected = <<EOS
Enter the command and numeric month and year or a year between 1800-3000.
Format: `./zeller.rb MM CCYY` or `.zeller.rb CCYY`
EOS
    assert_equal expected, output
  end

#Valid arguments must accompany run command of './zeller'
  def test_05_month_not_numeric
    output = `./zeller.rb xx 1970`
    expected = <<EOS
Enter the command and numeric month and year or a year between 1800-3000.
Format: `./zeller.rb MM CCYY` or `.zeller.rb CCYY`
EOS
    assert_equal expected, output
  end

#Date validation
  def test_06_month_missing
    output = `./zeller.rb 1945`
    expected = <<EOS
Enter the command and numeric month and year or a year between 1800-3000.
Format: `./zeller.rb MM CCYY` or `.zeller.rb CCYY`
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_07_year_not_numeric
    output = `./zeller.rb 04 xxxx`
    expected = <<EOS
Enter the command and numeric month and year or a year between 1800-3000.
Format: `./zeller.rb MM CCYY` or `.zeller.rb CCYY`
EOS
    assert_equal expected, output
  end

#Valid arguments
  def test_08_year_missing
    output = `./zeller.rb 11`
    expected = <<EOS
Enter the command and numeric month and year or a year between 1800-3000.
Format: `./zeller.rb MM CCYY` or `.zeller.rb CCYY`
EOS
    assert_equal expected, output
  end

#Valid January 2000
  def test_09_january_2000_six_week_month
    output = `./zeller.rb 01 2000`
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
    output = `./zeller.rb 02 1923`
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
    output = `./zeller.rb 03 1862`
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
    output = `./zeller.rb 04 1912`
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
    output = `./zeller.rb 05 1945`
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
    output = `./zeller.rb 06 1976`
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
    output = `./zeller.rb 07 1971`
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
    output = `./zeller.rb 08 1876`
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
    output = `./zeller.rb 09 1939`
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
    output = `./zeller.rb 10 1805`
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
    output = `./zeller.rb 11 1918`
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
    output = `./zeller.rb 12 1996`
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
    output = `./zeller.rb 02 2240`
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
  def test_22_full_standard_year
    output = `./zeller.rb 2971`
    expected = <<EOS
2971
January                     February                    March
Su  Mo  Tu  We  Th  Fr  Sa  Su  Mo  Tu  We  Th  Fr  Sa  Su  Mo  Tu  We  Th  Fr  Sa
        1   2   3   4   5                       1   2                       1   2
6   7   8   9   10  11  12  3   4   5   6   7   8   9   3   4   5   6   7   8   9
13  14  15  16  17  18  19  10  11  12  13  14  15  16  10  11  12  13  14  15  16
20  21  22  23  24  25  26  17  18  19  20  21  22  23  17  18  19  20  21  22  23
27  28  29  30  31          24  25  26  27  28          24  25  26  27  28  29  30
                                                        31

April                       May                         June
Su  Mo  Tu  We  Th  Fr  Sa  Su  Mo  Tu  We  Th  Fr  Sa  Su  Mo  Tu  We  Th  Fr  Sa
    1   2   3   4   5   6               1   2   3   4                           1
7   8   9   10  11  12  13  5   6   7   8   9   10  11  2   3   4   5   6   7   8
14  15  16  17  18  19  20  12  13  14  15  16  17  18  9   10  11  12  13  14  15
21  22  23  24  25  26  27  19  20  21  22  23  24  25  16  17  18  19  20  21  22
28  29  30                  26  27  28  29  30  31      23  24  25  26  27  28  29
                                                        30

July                        August                        September
Su  Mo  Tu  We  Th  Fr  Sa  Su  Mo  Tu  We  Th  Fr  Sa  Su  Mo  Tu  We  Th  Fr  Sa
    1   2   3   4   5   6                   1   2   3   1   2   3   4   5   6   7
7   8   9   10  11  12  13  4   5   6   7   8   9   10  8   9   10  11  12  13  14
14  15  16  17  18  19  20  11  12  13  14  15  16  17  15  16  17  18  19  20  21
21  22  23  24  25  26  27  18  19  20  21  22  23  24  22  23  24  25  26  27  28
28  29  30  31              25  26  27  28  29  30  31  29  30

October                     November                    December
Su  Mo  Tu  We  Th  Fr  Sa  Su  Mo  Tu  We  Th  Fr  Sa  Su  Mo  Tu  We  Th  Fr  Sa
        1   2   3   4   5                       1   2   1   2   3   4   5   6   7
6   7   8   9   10  11  12  3   4   5   6   7   8   9   8   9   10  11  12  13  14
13  14  15  16  17  18  19  10  11  12  13  14  15  16  15  16  17  18  19  20  21
20  21  22  23  24  25  26  17  18  19  20  21  22  23  22  23  24  25  26  27  28
27  28  29  30  31          24  25  26  27  28  29  30  29  30  31
EOS
    assert_equal expected, output
  end

#Valid Full Year 1900 Centenary Non Leap Year

#Valid Full Year 2000 Centenary Leap Year

end