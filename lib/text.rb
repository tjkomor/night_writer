require './lib/letters'
class Text
  attr_reader :string
  def initialize(string)
    @string = string
    @letters = Letters.new
    @line_1 = []
    @line_2 = []
    @line_3 = []
  end

  def split
    @string.chars
  end

  def get_value
    split.map do |letter|
     @letters.find_value(letter)
   end
  end

  def split_values
    get_value.join.chars
  end

  def insert_values
    index = 0
    counter = 0
    split_values_store = split_values
    until split_values_store.size == counter
      @line_1 << split_values_store[index..index + 1]
      index += 2
      @line_2 << split_values_store[index..index + 1]
      index += 2
      @line_3 << split_values_store[index..index + 1]
      index += 2
      counter += 6
    end
  end

  def line_one
    @line_1.flatten
  end

  def line_two
    @line_2.flatten
  end

  def line_three
    @line_3.flatten
  end


end
