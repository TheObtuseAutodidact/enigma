require 'minitest'
require 'minitest/autorun'
require './key1'

class KeyTest < Minitest::Test

  def test_it_exists
    assert Key
  end

  def test_key_is_instance_of_Key
    assert Key.new.is_a?(Key)
  end

  def test_key_is_of_appropriate_length
    assert_equal 5, Key.new.key.to_s.length
  end

  def test_key_accepts_a_default_value
    key_test = Key.new(12345)
    expected = 12345
    assert_equal 12345, key_test.key
  end

end
