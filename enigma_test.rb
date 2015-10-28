require 'minitest'
require 'minitest/autorun'
require_relative './enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    assert Enigma
  end

  def test_an_instance_is_an_object_of_class
    e = Enigma.new
    assert e.is_a?(Enigma)
  end

  def test_it_instantiates_with_a_numeric_key
    e = Enigma.new
    expected = e.key
    assert_equal Fixnum, e.key.class
  end

  def test_it_encrypts_a_single_character
    skip
    e = Enigma.new
    expected = e.encrypt("a")
  end
  end


end
