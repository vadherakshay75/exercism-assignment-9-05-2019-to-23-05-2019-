require 'byebug'

# all extend method
module Cleaner
  def str_size_11_and_str_0_is_1(str)
    str.size == 11 && str[0] == '1'
  end

  def size_11_and_str_0_not_1(str)
    (str.size == 11 && str[0] != '1')
  end

  def nil_if_starts_with_0(str)
    str[0] == '0'
  end

  def check_size_and_str_3(str)
    (str[0] == '1' && str.size == 10) || (str[3] == '0' || str[3] == '1')
  end

  def check_number_exchange_code(str)
    (str[4] == '0' || str[4] == '1')
  end

  def area_code_starts_with_0_or_1(str)
    (str[1] == '0' || str[1] == '1')
  end

  def check_validity_of_number(str)
    (str.size < 10) || (str.size > 11)
  end

  def clean_number(string)
    string.split(/\D/).join
  end
end

# PhoneNumber
class PhoneNumber
  extend Cleaner
  def self.clean(string)
    str = clean_number(string)
    status = check_number_exchange_code(str) || area_code_starts_with_0_or_1(str) ||
             check_size_and_str_3(str) || nil_if_starts_with_0(str) ||
             check_validity_of_number(str) || size_11_and_str_0_not_1(str)
    return nil if status
    return str[1..-1] if str_size_11_and_str_0_is_1(str)

    str
  end
end
