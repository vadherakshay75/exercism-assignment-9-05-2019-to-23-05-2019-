require 'byebug'
# run length encoding
class RunLengthEncoding
  def self.encode(input)
    array = input.split('')
    str = ''
    alpha_count = 0
    array.each_with_index do |char, index|
      second = array[index + 1]
      alpha_count += 1 if char == second
      next if char == second

      str += (alpha_count + 1).to_s if alpha_count > 0
      str += char
      alpha_count = 0
    end
    str
  end

  def self.decode(input)
    str = ''
    array = input.chars
    array_int = input.split(/[a-zA-Z ]/)
    return input if array_int.empty?

    array_char = []
    create_char_array(array, array_char).each_with_index do |char, index_one|
      str += setup_str(char, index_one, array_int)
    end
    diff = array_char.length - array_int.length
    str += array_char[-diff..-1].join if diff > 0
    str
  end

  def self.create_char_array(array, array_char)
    array.each do |char|
      begin
        next if Integer(char)
      rescue StandardError
        true
      end
      array_char << char
    end
    array_char
  end

  def self.setup_str(char, index_one, array_int)
    str = ''
    array_int.each_with_index do |number, index_two|
      next if index_one != index_two

      number = 1 if number.empty?
      (1..number.to_i).each do |_num|
        str += char
      end
    end
    str
  end
end
