require 'byebug'
class Allergies
  attr_accessor :allergic, :number, :array

  def initialize(number)
    @number = number
    @allergic = %w[eggs peanuts shellfish strawberries
                   tomatoes chocolate pollen cats]
    @array = []
  end

  def allergic_to?(string)
    fetch_array(number).include? string
  end

  def fetch_array(number)
    number -= 256 if number > 255
    (0..7).reverse_each do |index|
      if number >= 2**index
        array << allergic[index]
        number -= 2**index
      end
    end
    array
  end

  def list
    fetch_array(number)
  end
end
