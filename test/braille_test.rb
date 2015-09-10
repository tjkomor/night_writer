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

  def test_it_can_turn_lines_of_bits_into_array
    braille = Braille.new('00..')
    assert_equal ['0', '0', '.', '.'], braille.convert_to_array
  end

  def test_it_can_assemble_correct_array_of_braille_values_for_first_third
    braille = Braille.new("0.0.00..0..000.0.0..000.....00......")
    braille.assemble_values
    assert_equal ["0", ".", ".", ".", "0", "0", ".", ".", ".", ".", ".", "."], braille.first_third
  end

  def test_it_can_assemble_correct_array_of_braille_values_for_second_third
    braille = Braille.new("0.0.00..0..000.0.0..000.....00......")
    braille.assemble_values
    assert_equal ["0", ".", ".", ".", "0", "."], braille.second_third
  end

  def test_it_can_assemble_correct_array_of_braille_values_for_last_third
    braille = Braille.new("0.0.00..0..000.0.0..000.....00......")
    braille.assemble_values
    assert_equal ["0", "0", ".", ".", "0", "."], braille.last_third
  end

  def test_it_can_find_value_of_one_letter
    braille = Braille.new(".00.000.....000.0.")
    braille.assemble_values
    assert_equal 'm', braille.find_letter('001101')
    assert_equal 't', braille.find_letter('100001')
    assert_equal 'h', braille.find_letter('010011')

  end

  def test_it_can_split_first_array_into_chunks_of_six
    braille = Braille.new("0.0.00..0..000.0.0..000.....00......")
    braille.assemble_values
    assert_equal [["0", ".", ".", ".", "0", "0"], [".", ".", ".", ".", ".", "."]], braille.split_first_third_into_six
  end

  def test_it_can_split_second_array_into_chunks_of_six
    braille = Braille.new("0.0.00..0..000.0.0..000.....00......")
    braille.assemble_values
    assert_equal [["0", ".", "0", ".", ".", "0"], ["0", "0", ".", ".", ".", "."]], braille.split_second_third_into_six
  end

  def test_it_can_split_third_array_into_chunks_of_six
    braille = Braille.new("0.0.00..0..000.0.0..000.....00......")
    braille.assemble_values
    assert_equal [["0", "0", ".", "0", ".", "0"], ["0", ".", "0", "0", ".", "."]], braille.split_last_third_into_six
  end

  def test_it_can_join_chunks_of_six_into_strings_for_first_third
    skip
    braille = Braille.new("0.0.00..0..000.0.0..000.....00......")
    braille.assemble_values
    assert_equal ["010011", "111111"], braille.create_values_first_third
  end

  def test_it_can_join_chunks_of_six_into_strings_for_second_third
    braille = Braille.new("0.0.00..0..000.0.0..000.....00......")
    braille.assemble_values
    assert_equal ["010110", "001111"], braille.create_values_second_third
  end

  def test_it_can_join_chunks_of_six_into_strings_for_last_third
    braille = Braille.new("0.0.00..0..000.0.0..000.....00......")
    braille.assemble_values
    assert_equal ["001010", "010011"], braille.create_values_last_third
  end

  def test_it_can_find_values_of_multiple_letters
    braille = Braille.new("0.0.00..0..000.0.0..000.....00......")
    braille.assemble_values
    assert_equal "hey hi", braille.create_words
  end



end
