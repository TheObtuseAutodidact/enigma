require 'minitest'
require 'minitest/autorun'
require './offsets'
require './key1'

class OffsetsTest < Minitest::Test

  def test_it_exists
    assert OffsetsCalc
  end

  def test_it_is_an_instance_of_this_class
    assert OffsetsCalc.new("key").is_a?(OffsetsCalc)
  end

  def test_it_takes_key_as_input
    key = 12345 # stub
    assert_equal 12345, OffsetsCalc.new(12345).key
  end

  def test_it_has_a_date_attribute
    oc = OffsetsCalc.new(12345, "010115")
    assert_equal 10115, oc.date
  end

  def test_it_creates_offsets_from_key_and_date
    oc = OffsetsCalc.new(12345, "010115")
    assert_equal [15, 25, 36, 50], oc.offsets
  end

end
