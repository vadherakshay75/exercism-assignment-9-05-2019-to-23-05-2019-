require 'byebug'
require 'set'
# sum of multiples
class SumOfMultiples
  attr_accessor :array
  def initialize(*array)
    @array = array
  end

  def to(number)
    s1 = Set.new
    array.each do |num|
      return 0 if num.zero?

      x = multiple = 0
      while multiple < number
        multiple = num * x
        x += 1
        s1.add(multiple) if multiple < number
      end
    end
    s1.to_a.sum
  end
end
