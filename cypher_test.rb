require './cypher.rb'
require './encryption_hashes'
require 'minitest'
require 'minitest/autorun'

class CypherTest < Minitest::Test

  def test_it_exists
    assert Cypher
  end

  def test_an_instance_is_a_class_of
    assert Cypher.new("").is_a?(Cypher)
  end

  def test_it_takes_a_string_oof_chars
    encrypt0 = Cypher.new("a")
    encrypt1 = Cypher.new("123")
    encrypt2 = Cypher.new("here's a long one")
    assert_equal "a", encrypt0.input_string
    assert_equal "123", encrypt1.input_string
    assert_equal "here's a long one", encrypt2.input_string
  end

  def test_it_returns_encrypted_value_for_single_char_string
    message = Cypher.new("a")
    assert_equal "b", message.encrypt
  end



end
