gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/letters'
require './lib/text'
require './lib/braille'

class BrailleTest < Minitest::Test

  def test_it_can_take_in_braille
    braille = Braille.new('.00.')
    assert_equal '.00.', braille.braille
  end

  def test_it_can_join_braille_into_six_digit_key
    braille = Braille.new(['.0', '0.', '.0'])
    assert_equal '100110', braille.convert_to_bits
  end



end
