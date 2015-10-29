require 'date'
require_relative "./key1"
require_relative "./offsets_calc"
require_relative "./encryption_hashes"
require_relative "./encrypt_message"

class Enigma
  attr_reader :key

  def initialize
    @key = Key.new.key
    @date = Time.now.strftime("%m%d%y").to_i
    offsets = OffsetsCalc.new(@key, @date).offsets
    @encryption_hashes = EncryptionHashes.new(offsets).encryptors
  end

  def encrypt(message, key=@key, date=@date)
    EncryptMessage.new(message, EncryptionHashes.new(OffsetsCalc.new(key, date).offsets).encryptors).encrypt
  end

  def decrypt(message, key, date=@date)
      EncryptMessage.new(message, EncryptionHashes.new(OffsetsCalc.new(key, date).offsets).decryptors).encrypt
  end

  def crack(message, date=nil)
    char_set = ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
    string_key = [37, 37, 4, 13, 3, 37, 37] # end of string char_set indicies
    rotation_indicies = []
    mod = message.length % 4
    value_key = message[-7..-1].split("")
    string_key.zip(value_key).each do |item|
      rotation_indicies << char_set.rotate(item[0]).index(item[1])
    end
    rotation_indicies.pop(mod) if mod > 0
    EncryptMessage.new(message, EncryptionHashes.new(rotation_indicies[-4..-1]).decryptors).encrypt
  end
end
