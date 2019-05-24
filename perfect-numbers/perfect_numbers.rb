# Exercism PerfectNumber
class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num < 0

    array = []
    (1..num).each do |n|
      array << n if ((num / n) * n) == num && n < num
    end
    type_of_number(array, num)
  end

  def self.type_of_number(array, num)
    return 'deficient' if array.sum < num
    return 'perfect' if array.sum == num
    return 'abundant' if array.sum > num
  end
end
