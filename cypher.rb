require './encryption_hashes'

class Cypher
  attr_reader :input_string

  def initialize(input_string)
    @input_string = input_string
  end

  def encrypt
    EncryptionHashes.rot_array(input_string)
  end


end
