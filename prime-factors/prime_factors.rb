require 'prime'
require 'byebug'
class PrimeFactors
  def self.for(number)
    array = []
    array_of_multiple = Prime.prime_division(number)
    array_of_multiple.each do |array_multiple|
      array_multiple.last.times { array << array_multiple.first }
    end
    array
  end
end
