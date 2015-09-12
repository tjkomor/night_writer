require './lib/letters'
class Text
  attr_reader :string
  def initialize(string)
    @string = string.chomp
    @line_1 = []
    @line_2 = []
    @line_3 = []
  end

  def braille
    split_string
    get_value
    split_values
    create_lines
    lines.join("\n")
  end

  def lines
    [ line_one_to_braille,
      line_two_to_braille,
      line_three_to_braille,
    ]
  end

  def split_string
    if @string.length > 40
      "too many words"
    else
      @string.chars
    end
  end

  def get_value
    split_string.map do |letter|
      Letters.new.find_value(letter)
    end
  end

  def split_values
    get_value.join.chars
  end

  def create_lines
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

  def line_one_to_braille
    @line_1.flatten.join.gsub('1', '.')
  end

  def line_two_to_braille
    @line_2.flatten.join.gsub('1', '.')
  end

  def line_three_to_braille
    @line_3.flatten.join.gsub('1', '.')
  end


end
