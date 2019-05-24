require 'byebug'
# Nucleotide exercism
class Nucleotide
  def self.from_dna(str)
    str.chars.each { |i| return raise ArgumentError unless i.include?(%w[A T C G]) }
    str
  end
end

# String Override method include for array
class String
  def histogram
    { 'A' => count('A'), 'T' => count('T'), 'C' => count('C'), 'G' => count('G') }
  end

  def include?(parameter)
    if parameter.is_a? Array
      parameter.include?(self)
    else
      super
    end
  end
end
