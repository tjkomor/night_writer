gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/letters'

class LettersTest < Minitest::Test

  def test_letters_hold_correct_value
    letters = Letters.new
    assert_equal '001111', letters.find_value('c')
    assert_equal '000001', letters.find_value('q')
    assert_equal '111111', letters.find_value(' ')
    refute_equal '345681', letters.find_value('w')
  end

  def test_values_hold_correct_letter
    letters = Letters.new
    assert_equal 't', letters.find_key('100001')
    assert_equal 'z', letters.find_key('011000')
    assert_equal ' ', letters.find_key('111111')
    refute_equal 'r', letters.find_key('812345')
  end

end
