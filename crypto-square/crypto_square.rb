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
    words.map(&:chars).transpose.map(&:join).join(' ')
  end

  private

  def setup_string(count, diff)
    diff2 = count - diff
    str1 = ''
    diff2.times { str1 += ' ' }
    str1
  end
end
