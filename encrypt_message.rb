require_relative'./encryption_hashes'
require 'pry'
class EncryptMessage
  attr_reader :encryptors
  attr_accessor :message

  def initialize(message, encryption_hashes = EncryptionHashes.new(offsets =(OffsetsCalc.new(key=Key.new.key, date=Time.now.strftime("%m%d%y")))).encryptors)
    @message = message
    @encryptors = encryption_hashes
  end

  def encrypt
    @message = message.split("")
    encrypted_message = []
    counter = 0
    message.each do |letter|
      #binding.pry                                                  # => nil
      encrypted_message << encryptors[counter % 4][letter]
      counter += 1
    end
    encrypted_message = encrypted_message.join
    return encrypted_message
  end

end

em = EncryptMessage.new("test", EncryptionHashes.new([1,2,3,4]).encryptors)
