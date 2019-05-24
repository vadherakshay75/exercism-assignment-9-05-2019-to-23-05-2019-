require 'byebug'

class Proverb
  attr_accessor :arr, :hash
  def initialize(*arr)
    @arr = arr
    @hash = arr.last.is_a?(Hash) ? ' ' + arr.last[:qualifier] : ''
  end

  def to_s
    string = ''
    arr.each_cons(2).map do |first, second|
      string += "For want of a #{first} the #{second} was lost.\n" unless
               second.is_a?(Hash)
    end
    "#{string}And all for the want of a#{hash} #{arr.first}."
  end
end
