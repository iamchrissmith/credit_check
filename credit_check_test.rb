require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require_relative 'credit_check'

class CreditCheckTest < MiniTest::Test
  def test_class_exists
    ccheck = CreditCheck.new
    assert ccheck
  end
  def test_stringify_returns_string
    ccheck = CreditCheck.new
    number = 123456789012345
    assert_instance_of String, ccheck.stringify(number)
  end
  def test_split_string_returns_array_of_elements
    ccheck = CreditCheck.new
    string = "123"
    assert_equal ccheck.split_string(string), ["1","2","3"]
  end
  def test_sum_array_of_numbers
    ccheck = CreditCheck.new
    numbers = [1,2,3]
    assert_equal ccheck.sum_array(numbers), 6
  end
  def test_reverse_the_number
    ccheck = CreditCheck.new
    number = "0123456789012345"
    reversed_number = "5432109876543210"
    assert ccheck.reverse_number(number), reversed_number
  end
  def test_combine_large
    ccheck = CreditCheck.new
    number = 11
    assert_equal 2, ccheck.combine_large(number)
  end
  def test_process_doubling
    ccheck = CreditCheck.new
    number = "2"
    index = 0
    assert_equal 2, ccheck.process_number_to_double(number, index)
    number = "2"
    index = 1
    assert_equal 4, ccheck.process_number_to_double(number, index)
    number = "8"
    index = 1
    assert_equal 7, ccheck.process_number_to_double(number, index)
  end
  def test_doubles_every_second_digit_after_reverse
    ccheck = CreditCheck.new
    number = %w(5 4 3 2 1 0 9 8)
    new_number = [5,8,3,4,1,0,9,7]
    assert_equal ccheck.collect_double_numbers(number), new_number
  end
  def test_validate_returns_true
    ccheck = CreditCheck.new
    number1 = "5541808923795240"
    number2 = "4024007136512380"
    number3 = "6011797668867828"
    assert ccheck.validate(number1)
    assert ccheck.validate(number2)
    assert ccheck.validate(number3)
  end
  def test_validate_returns_false
    ccheck = CreditCheck.new
    number1 = "5541801923795240"
    number2 = "4024007106512380"
    number3 = "6011797668868728"
    refute ccheck.validate(number1)
    refute ccheck.validate(number2)
    refute ccheck.validate(number3)
  end

  def test_american_express_true
    ccheck = CreditCheck.new
    number1 = "342804633855673" #passing
    assert ccheck.validate(number1)
  end

  def test_american_express_false
    ccheck = CreditCheck.new
    number2 = "342801633855673" #failing
    refute ccheck.validate(number2)
  end
end
