require_relative'./encryption_hashes'

class EncryptMessage
  attr_reader :encryptors
  attr_accessor :message

  def initialize(message, encryption_hashes)
    @message = message.downcase
    @encryptors = encryption_hashes
  end

  def encrypt
    @message = message.split("")
    encrypted_message = []
    counter = 0
    message.each do |letter|
      encrypted_message << encryptors[counter % 4][letter]
      counter += 1
    end
    encrypted_message = encrypted_message.join
    return encrypted_message
  end

end
