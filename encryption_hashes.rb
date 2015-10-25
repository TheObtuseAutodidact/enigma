class EncryptionHashes
  attr_reader :char_set


  def initialize
    @char_set = ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
  end

  def rot_array(keys)
    rot_array = []
    keys.each do |key|
      encrypt_arr = @char_set.rotate(key)
      rot_array << Hash[@char_set.zip(encrypt_arr)]
    end
    puts rot_array.inspect
    rot_array
  end

end
