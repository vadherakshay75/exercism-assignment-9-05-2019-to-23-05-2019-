require 'byebug'
class School
  attr_accessor :hash
  def initialize
    @hash = Hash.new { |hash, key| hash[key] = [] }
  end

  def add(name, grade)
    hash[grade].push(name)
  end

  def students(grade)
    hash[grade].sort
  end

  def students_by_grade
    return [] if hash.empty?

    hash.sort.collect do |grade, name|
      {
        grade: grade, students: name.sort
      }
    end
  end
end
