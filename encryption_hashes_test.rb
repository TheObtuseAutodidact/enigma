require './key.rb'
require './encryption_hashes.rb'
require 'minitest'
require 'minitest/autorun'

class EncrytionHashesTest < Minitest::Test

  def test_it_exists
    assert EncryptionHashes
  end

  def test_it_is_an_instance_of_this_class
    assert EncryptionHashes.new.is_a?(EncryptionHashes)
    hashes = EncryptionHashes.new
    assert hashes.is_a?(EncryptionHashes)
    end

    def test_it_initialize_with_char_set
      hashes = EncryptionHashes.new
      assert_equal 39, hashes.char_set.length
    end

    def test_it_creates_char_array_with_rotations_by_key
      hashes = EncryptionHashes.new
      assert_equal 'b', hashes.rot_array([1])[0]['a']
    end

    def test_it_creates_char_arrays_with_rotaion_keys
      hashes = EncryptionHashes.new
      assert_equal 'c', hashes.rot_array([1])[0]['b']
      assert_equal 'd', hashes.rot_array([1, 2])[1]['b']
      assert_equal 'e', hashes.rot_array([1, 2, 3])[2]['b']
      assert_equal 'f', hashes.rot_array([1, 2, 3, 4])[3]['b']
    end

end
