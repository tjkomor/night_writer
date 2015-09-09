gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/letters'

class LettersTest < Minitest::Test

  def test_letters_hold_correct_value
    letters = Letters.new
    assert_equal '003456', letters.find_value('c')
    assert_equal '000006', letters.find_value('q')
    assert_equal '123456', letters.find_value(' ')
    refute_equal '345681', letters.find_value('w')
  end

  def test_values_hold_correct_letters
    letters = Letters.new
    assert_equal 't', letters.find_key('100006')
    assert_equal 'z', letters.find_key('023000')
    assert_equal ' ', letters.find_key('123456')
    refute_equal 'r', letters.find_key('812345')
  end

end
