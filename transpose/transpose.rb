require 'byebug'
# Exercism Transpose
class Transpose
  def self.transpose(input)
    str = ''
    sum_of_size = counter = range = 0
    array = input.split(/\n/)
    array.each do |ele|
      sum_of_size += ele.size
      range = ele.size if range < ele.size
    end
    design_str(sum_of_size, range, array, str, counter)
  end

  def self.design_str(sum_of_size, range, array, str, counter)
    sum_of_size += (range - 1)
    (0..range - 1).each do |index|
      array.each do |element|
        str += ' ' if element[index].nil? && sum_of_size != str.size
        str += element[index] unless element[index].nil?
      end
      str += "\n" if counter < range - 1
      counter += 1
    end
    str
  end
end
