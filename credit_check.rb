require 'pry'

class CreditCheck
  def stringify(number)
    number = number.to_s
  end

  def reverse_number(number)
    number = stringify(number)
    number.reverse
  end

  def split_string(text)
    text.split("")
  end

  def sum_array(numbers)
    numbers.reduce(:+)
  end

  def combine_large(large)
    large_text = large.to_s
    large_text[0].to_i + large_text[1].to_i
  end

  def process_number_to_double(num_text, index)
      this_number = num_text.to_i
      return this_number if index % 2 == 0

      new_number = this_number * 2

      new_number < 9 ? new_number : combine_large(new_number)
  end

  def collect_double_numbers(numbers)
    numbers.map.with_index do |n,i|
      process_number_to_double(n, i)
    end
  end

  def validate(number)
    reversed_number = reverse_number(number)
    split_numbers = split_string(reversed_number)
    collected_numbers = collect_double_numbers(split_numbers)
    sum = sum_array(collected_numbers)
    sum % 10 == 0
  end

end
