require './key.rb'
require './encryption_hashes'
require './encrypt_message'
require 'minitest'
require 'minitest/autorun'

class EncryptMessageTest < Minitest::Test

  def test_it_exists
    assert EncryptMessage
  end

  def test_it_is_an_instance_of_this_class
    assert EncryptMessage.new("test", [1,2,3,4]).is_a?(EncryptMessage)
  end

  def test_it_takes_a_message_of_one_char
    em = EncryptMessage.new("a", [1, 2, 3, 4])
    assert_equal "a", em.message
  end

  def test_it_can_encrypt_a_message_of_one_char
    hashes = EncryptionHashes.new([1,2,3,4]).encryptors #how do I call this method?
    #hashes = hashes.encryptors
    em = EncryptMessage.new("a", hashes)
    assert_equal "b", em.encrypt
  end

  def test_it_can_encrypt_message_of_more_than_one_char
    hashes = EncryptionHashes.new([1,2,3,4])
    hashes = hashes.encryptors
    em = EncryptMessage.new("aa", hashes)
    em1 = EncryptMessage.new("abc", hashes)
    em2 = EncryptMessage.new("aaaaaaaa", hashes)
    assert_equal "bc", em.encrypt
    assert_equal "bcdebcde", em2.encrypt
  end

end
