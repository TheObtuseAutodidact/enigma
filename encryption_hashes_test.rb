require './key1.rb'
require './encryption_hashes.rb'
require 'minitest'
require 'minitest/autorun'

class EncryptionHashesTest < Minitest::Test

  def test_it_exists
    assert EncryptionHashes
  end

  def test_it_is_an_instance_of_this_class
    assert EncryptionHashes.new([1,2,3,4]).is_a?(EncryptionHashes)
    hashes = EncryptionHashes.new([1,2,3,4])
    assert hashes.is_a?(EncryptionHashes)
    end

    def test_it_initialize_with_char_set
      hashes = EncryptionHashes.new([1,2,3,4])
      assert_equal 39, hashes.char_set.length
    end

    def test_it_creates_char_array_with_rotations_by_key
      hashes = EncryptionHashes.new([1])
      assert_equal 'b', hashes.encryptors[0]['a']
    end

    def test_it_creates_char_arrays_with_rotaion_keys
      hashes = EncryptionHashes.new([1, 2, 3, 4])
      assert_equal 'c', hashes.encryptors[0]['b']
      assert_equal 'd', hashes.encryptors[1]['b']
      assert_equal 'e', hashes.encryptors[2]['b']
      assert_equal 'f', hashes.encryptors[3]['b']
    end

end
