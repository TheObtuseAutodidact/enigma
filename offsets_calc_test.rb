require 'minitest'
require 'minitest/autorun'
require './offsets_calc'
require './key1'

class OffsetsTest < Minitest::Test

  def test_it_exists
    assert OffsetsCalc
  end

  def test_it_is_an_instance_of_this_class
    assert OffsetsCalc.new("key").is_a?(OffsetsCalc)
  end

  def test_it_takes_key_as_input
    oc = OffsetsCalc.new(12345)
    expected = 12345
    assert_equal expected, oc.key
  end

  def test_it_has_a_date_attribute
    oc = OffsetsCalc.new(12345, "110115")
    expected = 110115
    assert_equal expected, oc.date
  end

  def test_it_creates_offsets_from_key_and_date
    oc = OffsetsCalc.new(12345, "010115")
    expected = [15, 25, 36, 50]
    assert_equal expected, oc.offsets
  end

end
