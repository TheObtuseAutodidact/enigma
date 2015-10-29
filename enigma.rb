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
    string_key = [37, 37, 4, 13, 3, 37, 37]
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


e = Enigma.new                           # => #<Enigma:0x007fc7b2830730 @key=99836, @date=102815, @encryption_hashes=[{"a"=>"z", "b"=>"0", "c"=>"1", "d"=>"2", "e"=>"3", "f"=>"4", "g"=>"5", "h"=>"6", "i"=>"7", "j"=>"8", "k"=>"9", "l"=>" ", "m"=>".", "n"=>",", "o"=>"a", "p"=>"b", "q"=>"c", "r"=>"d", "s"=>"e", "t"=>"f", "u"=>"g", "v"=>"h", "w"=>"i", "x"=>"j", "y"=>"k", "z"=>"l", "0"=>"m", "1"=>"n", "2"=>"o", "3"=>"p", "4"=>"q", "5"=>"r", "6"=>"s", "7"=>"t", "8"=>"u", "9"=>"v", " "=>"w", "."=>"x", ","=>"y"}, {"a"=>"w", "b"=>"x", "c"=>"y", "d"=>"z", "e"=>"0", "f"=>"1", "g"=>"2", "h"=>"3", "i"=>"4", "j"=>"5", "k"=>"6", "l"=>"7", "m"=>"8", "n"=>"9", "o"=>" ", "p"=>".", "q"=>",", "r"=>"a", "s"=>"b", "t"=>"c", "u"=>"d", "v"=>"e", "w"=>"f", "x"=>"g", "y"=>"h", "z"=>"i", "0"=>"j", "1"=>"k", "2"=>"l", "3"=>"m", "4"=>"n", "5"=>"o", "6"=>"p", "7"=>"q", "8"=>"r", "9"=>"s", " "=>"t", "."=>"u", ","=>"v"}, {"a"=>"h", "b"=>"i", "c"=>"j", "d"=>"k", "e"=>"l", "f"=>"m", "g"=>"n", "h"=>"o", "i"=>"p", "j"=...
x = e.encrypt("secret message ..end..")  # => "e0jt3ceo3bzc50eax0ufxu"
puts e.crack(x)                          # => nil

f = Enigma.new
y = f.encrypt("a longer message to test the crack method. we really want to see if it works..end..")
puts f.crack(y)
# e.encrypt("this string")                          # => "gwkfx7ve82i"
# #e.encrypt("aaaaaaaaaaaa")                         # => "p5vwp5vwp5vw"
# e.decrypt(",m76qxf51s5", 93649, 102815)           # => "tngr yrqite"
# with_key_input = Enigma.new                       # => #<Enigma:0x007f8b04829628 @key=81330, @date=2015-10-28 17:51:24 -0600, @encryption_hashes=[{"a"=>"l", "b"=>"m", "c"=>"n", "d"=>"o", "e"=>"p", "f"=>"q", "g"=>"r", "h"=>"s", "i"=>"t", "j"=>"u", "k"=>"v", "l"=>"w", "m"=>"x", "n"=>"y", "o"=>"z", "p"=>"0", "q"=>"1", "r"=>"2", "s"=>"3", "t"=>"4", "u"=>"5", "v"=>"6", "w"=>"7", "x"=>"8", "y"=>"9", "z"=>" ", "0"=>".", "1"=>",", "2"=>"a", "3"=>"b", "4"=>"c", "5"=>"d", "6"=>"e", "7"=>"f", "8"=>"g", "9"=>"h", " "=>"i", "."=>"j", ","=>"k"}, {"a"=>"t", "b"=>"u", "c"=>"v", "d"=>"w", "e"=>"x", "f"=>"y", "g"=>"z", "h"=>"0", "i"=>"1", "j"=>"2", "k"=>"3", "l"=>"4", "m"=>"5", "n"=>"6", "o"=>"7", "p"=>"8", "q"=>"9", "r"=>" ", "s"=>".", "t"=>",", "u"=>"a", "v"=>"b", "w"=>"c", "x"=>"d", "y"=>"e", "z"=>"f", "0"=>"g", "1"=>"h", "2"=>"i", "3"=>"j", "4"=>"k", "5"=>"l", "6"=>"m", "7"=>"n", "8"=>"o", "9"=>"p", " "=>"q", "."=>"r", ","=>"s"}, {"a"=>",", "b"=>"a", "c"=>"b", "d"=>"c", "e"=>"d", "f"=>"e", "g"=>"...
# with_key_input.encrypt("ssssssss",11111, 110115)  # => "65586558"
# decr = Enigma.new                                 # => #<Enigma:0x007f8b03913f58 @key=38975, @date=2015-10-28 17:51:24 -0600, @encryption_hashes=[{"a"=>"h", "b"=>"i", "c"=>"j", "d"=>"k", "e"=>"l", "f"=>"m", "g"=>"n", "h"=>"o", "i"=>"p", "j"=>"q", "k"=>"r", "l"=>"s", "m"=>"t", "n"=>"u", "o"=>"v", "p"=>"w", "q"=>"x", "r"=>"y", "s"=>"z", "t"=>"0", "u"=>"1", "v"=>"2", "w"=>"3", "x"=>"4", "y"=>"5", "z"=>"6", "0"=>"7", "1"=>"8", "2"=>"9", "3"=>" ", "4"=>".", "5"=>",", "6"=>"a", "7"=>"b", "8"=>"c", "9"=>"d", " "=>"e", "."=>"f", ","=>"g"}, {"a"=>"r", "b"=>"s", "c"=>"t", "d"=>"u", "e"=>"v", "f"=>"w", "g"=>"x", "h"=>"y", "i"=>"z", "j"=>"0", "k"=>"1", "l"=>"2", "m"=>"3", "n"=>"4", "o"=>"5", "p"=>"6", "q"=>"7", "r"=>"8", "s"=>"9", "t"=>" ", "u"=>".", "v"=>",", "w"=>"a", "x"=>"b", "y"=>"c", "z"=>"d", "0"=>"e", "1"=>"f", "2"=>"g", "3"=>"h", "4"=>"i", "5"=>"j", "6"=>"k", "7"=>"l", "8"=>"m", "9"=>"n", " "=>"o", "."=>"p", ","=>"q"}, {"a"=>"y", "b"=>"z", "c"=>"0", "d"=>"1", "e"=>"2", "f"=>"3", "g"=>"...
# decr.decrypt("65586558", 11111, 110115 )          # => "ssssssss"
