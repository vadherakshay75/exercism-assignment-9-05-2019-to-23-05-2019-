require 'byebug'
class BeerSong
  def self.recite(starting_number, loop_count)
    return no_bottle if starting_number.zero?

    array_of_str = []
    (1..loop_count).each do
      (1..starting_number).reverse_each do |index|
        array_of_str << string(index)
      end
    end
    if starting_number < loop_count
      return array_of_str[0..loop_count - 2].join("\n") + "\n" + no_bottle
    end

    array_of_str[0..loop_count - 1].join("\n")
  end

  def self.no_bottle
    "No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def self.string(index)
    case index
    when 2
      "#{index} bottles of beer on the wall, #{index} bottles of beer.
Take one down and pass it around, #{index - 1} bottle of beer on the wall.\n"
    when 1
      "#{index} bottle of beer on the wall, #{index} bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.\n"
    else
      "#{index} bottles of beer on the wall, #{index} bottles of beer.
Take one down and pass it around, #{index - 1} bottles of beer on the wall.\n"
    end
  end
end
puts BeerSong.recite(2, 3)
