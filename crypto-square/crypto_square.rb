require 'byebug'
class Crypto
  attr_accessor :plaintext

  def initialize(plaintext)
    @plaintext = plaintext.split(/[ @%!.,]/).join.downcase
  end

  def ciphertext
    count = 1
    str_size = 0
    count += 1 while count**2 < plaintext.size
    words = plaintext.scan(/.{#{count}}/)
    words.each do |word|
      str_size += word.length
    end
    diff = plaintext.size - str_size
    words << (plaintext[-diff..-1] + setup_string(count, diff)) if diff > 0
    two_d_array = make_2d_array(words).transpose
    words = join_2d_array(two_d_array)
    words.join(' ')
  end

  private

  def join_2d_array(two_d_array)
    array = []
    two_d_array.each do |word|
      array << word.join
    end
    array
  end

  def make_2d_array(words)
    array = []
    words.each do |word|
      array << (word.chars rescue '')
    end
    array
  end

  def setup_string(count, diff)
    diff2 = count - diff
    str1 = ''
    diff2.times { str1 += ' ' }
    str1
  end
end
