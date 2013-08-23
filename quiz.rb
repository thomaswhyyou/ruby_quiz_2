#  _______  _______  ___   _______  __
# |       ||       ||   | |       ||  |
# |_     _||    ___||   | |    ___||  |
#   |   |  |   | __ |   | |   |___ |  |
#   |   |  |   ||  ||   | |    ___||__|
#   |   |  |   |_| ||   | |   |     __
#   |___|  |_______||___| |___|    |__|

QUIZ_TOPICS = ["ruby", "rspec", "testing", "arrays", "objects"]

# create a quiz object
class Quiz
  attr_reader :numbers, :trash

  def initialize
    @numbers = []
    @trash = []
  end

  def add(num)
    num_array = []
    if num.class != Array
      num_array << num
    else
      num_array = num.flatten
    end

    num_array.each do |each_num|
      if each_num.class == Fixnum
        @numbers << each_num
      else
        @trash << each_num
      end
    end
  end

  def numbers
    return @numbers.to_s
  end

  def trash
    return @trash.to_s
  end

  def count(num)
    @numbers.count(num)
  end

  def rotate(length)
    length.times do |i|
      item = @numbers.shift
      @numbers.push(item)
    end
  end

  def count_evens
    count_array = []
    @numbers.each do |num|
      if num % 2 == 0
        count_array << num
      end
    end
    count_array.length
  end
end

# We can add numbers to it
# quiz = Quiz.new
# quiz.add(5)
# quiz.add(3)

# We can see the numbers we've added
# quiz.numbers => "[5, 3]"

# We can only add numbers
# quiz.add("7")
# quiz.numbers => "[5, 3]"

# Or arrays of numbers
# quiz.add([4, 2, true, 9])
# quiz.numbers => "[5, 3, 4, 2, 9]"

# We can't access the array directly
# quiz.numbers.push(5)
# => undefined method `push'

# Trash returns anything we've tried to add that's not a number.
# quiz.trash => ["7", true]

# Returns the number of occurences of a specified number
# quiz.numbers => "[5, 3, 4, 3]"
# quiz.count(3) => 2

# Takes a specified length of an array starting from the left and moves it to
# the tail end
# quiz.numbers => "[5, 3, 9, 4, 3]"
# quiz.rotate(2)
# quiz.numbers => "[9, 4, 3, 5, 3]"

# Prints out the number of even numbers in the array.
# quiz.numbers => "[9, 4, 3, 5, 3]"
# quiz.count_evens => 1