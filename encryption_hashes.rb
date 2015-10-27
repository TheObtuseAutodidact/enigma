require_relative './offsets_calc'

class EncryptionHashes
  attr_reader :char_set, :offsets


  def initialize(offsets =(OffsetsCalc.new(key=Key.new, date=Time.now.strftime("%m%d%y")).offsets))
    @char_set = ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
    @offsets = offsets
  end

  def encryptors
    encryptors = []
    offsets.each do |offset|
      encrypt_arr = @char_set.rotate(offset)
      encryptors << Hash[@char_set.zip(encrypt_arr)]
    end
    puts encryptors  ################################
    return encryptors
  end

end


# eh = EncryptionHashes.new([1,2,3,4])
# eh.encryptors
