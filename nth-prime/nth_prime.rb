require 'prime'
# Exercism Prime
class Prime
  def self.nth(number)
    raise ArgumentError if number < 1

    array = Prime.first number
    array.last
  end
end
puts Prime.nth(1)
