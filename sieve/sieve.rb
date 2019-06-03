require 'prime'
class Sieve
  attr_accessor :number
  def initialize(number)
    @number = number
  end

  def primes
    prime_array = []
    Prime.each(number) do |prime|
      prime_array << prime
    end
    prime_array
  end
end
