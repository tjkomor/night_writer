require './lib/text'
class Braille
  attr_reader :braille
  def initialize(braille)
    @braille = braille
    @values = []
  end

  def convert_to_bits
    @braille.join.gsub('.', '1')
  end
end
