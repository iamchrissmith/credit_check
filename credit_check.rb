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

  def collect_doubled_numbers(numbers)
    numbers.map.with_index do |n,i|
      i % 2 == 0 ? n.to_i : n.to_i * 2
    end
  end

  def validate(number)
    reversed_number = reverse_number(number)
    split_numbers = split_string(reversed_number)
    doubled_numbers = collect_doubled_numbers(split_numbers)
    combined_numbers = doubled_numbers.map do |n|
      n.to_i < 9 ? n.to_i : combine_large(n.to_i)
    end
    sum = sum_array(combined_numbers)
    sum % 10 == 0
  end

end
