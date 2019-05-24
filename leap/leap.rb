require 'byebug'
class Year
  def self.leap?(integer)
    (integer % 4).zero? && (integer % 100 != 0) || (integer % 400).zero?
  end
end
