require 'minitest'
require 'minitest/autorun'
require './lib/offsets_calc.rb'
require './lib/enigma'

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
    OffsetsCalc.new(11111, 110115).offsets.inspect
    e = Enigma.new
    assert_equal 'o', e.encrypt("a", 11111, 110115)
  end

  def test_it_encrypts_a_longer_string
    e = Enigma.new
    assert_equal '8fq48fq4', e.encrypt("tttttttt", 12345, 110115)
  end

  def test_it_decrypts_a_single_char
    e = Enigma.new
    x = e.encrypt("a", 956784, 122799)
    assert_equal "a", e.decrypt(x, 956784, 122799)
  end

  def test_it_can_decrypt_longer_strings
    e = Enigma.new
    x = e.encrypt("a longer string", 12345, 101015)
    assert_equal "a longer string", e.decrypt(x, 12345, 101015)
  end

  def test_it_craks_a_single_encrypted_char
    e = Enigma.new
    x = e.encrypt("a..end..", 12345, 101015)
    assert_equal "a..end..", e.crack(x)
  end

  def test_it_cracks_a_longer_string
    e = Enigma.new
    x = e.encrypt("this is a longer string for the testing..end..", 12345, 101015)
    assert_equal "this is a longer string for the testing..end..", e.crack(x)
  end


end
