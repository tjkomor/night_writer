require './lib/text'
class Braille
  attr_reader :braille
  def initialize(braille)
    @braille = braille
    @first_third = []
    @second_third = []
    @last_third = []
  end

  def convert_to_array
    @braille.chars
  end

  def assemble_values
    index = 0
    until convert_to_array.size / 3 == @first_third.size
      @first_third << convert_to_array[index..index + 1]
      index += 2
      @second_third << convert_to_array[index..index + 1]
      index += 2
      @last_third << convert_to_array[index..index + 1]
      index += 2
    end
  end

  def first_third
    @first_third.flatten.compact
  end

  def second_third
    @second_third.flatten.compact
  end

  def last_third
    @last_third.flatten.compact
  end

  def split_first_third_into_six
    new_array = []
    first_third.each_slice(6) { |braille| new_array << braille }
    new_array
  end

  def split_second_third_into_six
    new_array = []
    second_third.each_slice(6) { |braille| new_array << braille }
    new_array
  end

  def split_last_third_into_six
    new_array = []
    last_third.each_slice(6) { |braille| new_array << braille }
    new_array
  end


  def find_letter(value)
    Letters.new.find_key(value)
  end

  def create_words

  end

end
