gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/letters'
require './lib/text'

class TextTest < Minitest::Test

  def test_it_converts_english_to_braille
    braille = "0.0.0.0.0....00.0.0.00\n" +
              "00.00.0..0..00.0000..0\n" +
              "....0.0.0....00.0.0..."
    assert_equal braille, Text.new("hello world").braille
  end


  def test_it_can_take_in_string
    text = Text.new("hello")
    assert_equal "hello", text.string
  end

  def test_it_can_split_string_into_array
    text = Text.new("hello")
    assert_equal ["h", "e", "l", "l", "o"], text.split_string
  end

  def test_it_will_return_message_if_input_string_is_longer_than_284_characters
    text = Text.new('im going to pound on the keyboard until i get_value
    to forty characters im not sure how')
    assert_equal "too many words", text.split_string
  end

  def test_it_can_find_braille_value_of_one_letter_in_array
    text = Text.new("t")
    assert_equal ['100001'], text.get_value
    refute_equal ['345123'], text.get_value
    text = Text.new('d')
    assert_equal ["001011"], text.get_value
    text = Text.new(' ')
    assert_equal ['111111'], text.get_value
  end

  def test_it_returns_nil_array_if_key_does_not_exist
    text = Text.new('6')
    assert_equal [nil], text.get_value
  end

  def test_it_can_store_all_values_of_multiple_letters_in_array
    text = Text.new("tyler")
    assert_equal ["100001", "001000", "010101", "011011", "010001"], text.get_value
    refute_equal ['389379620872070'], text.get_value
    text = Text.new("hey how is it going")
    assert_equal ["010011", "011011", "001000", "111111", "010011", "011001", "100010", "111111",
      "100111", "100101", "111111", "100111", "100001",
      "111111", "000011", "011001", "100111", "001001", "000011"], text.get_value
  end

  def test_it_can_split_values_into_individual_characters
    text = Text.new('h')
    assert_equal ["0", "1", "0", "0", "1", "1"], text.split_values
    text = Text.new('p')
    assert_equal ["0", "0", "0", "1", "0", "1"], text.split_values
  end

  def test_lines_of_arrays_convert_to_correct_braille
    text = Text.new('if')
    assert_equal ["1", "0", "0", "1", "1", "1", "0", "0", "0", "1", "1", "1"], text.split_values
    text.create_lines
    assert_equal ".000", text.line_one_to_braille
    assert_equal "0.0.", text.line_two_to_braille
    assert_equal "....", text.line_three_to_braille
    refute_equal "4567", text.line_one_to_braille
  end


end
