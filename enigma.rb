require 'date'                          # => true
require_relative "./key1"               # => true
require_relative "./offsets_calc"       # => true
require_relative "./encryption_hashes"  # => true
require_relative "./encrypt_message"    # => true
class Enigma
  attr_reader :key

  def initialize
    @key = Key.new.key                                             # => 84035
    date = Date.today                                              # => #<Date: 2015-10-28 ((2457324j,0s,0n),+0s,2299161j)>
    offsets = OffsetsCalc.new(@key, date).offsets                  # => [84, 42, 5, 40]
    @encryption_hashes = EncryptionHashes.new(offsets).encryptors  # => [{"a"=>"g", "b"=>"h", "c"=>"i", "d"=>"j", "e"=>"k", "f"=>"l", "g"=>"m", "h"=>"n", "i"=>"o", "j"=>"p", "k"=>"q", "l"=>"r", "m"=>"s", "n"=>"t", "o"=>"u", "p"=>"v", "q"=>"w", "r"=>"x", "s"=>"y", "t"=>"z", "u"=>"0", "v"=>"1", "w"=>"2", "x"=>"3", "y"=>"4", "z"=>"5", "0"=>"6", "1"=>"7", "2"=>"8", "3"=>"9", "4"=>" ", "5"=>".", "6"=>",", "7"=>"a", "8"=>"b", "9"=>"c", " "=>"d", "."=>"e", ","=>"f"}, {"a"=>"d", "b"=>"e", "c"=>"f", "d"=>"g", "e"=>"h", "f"=>"i", "g"=>"j", "h"=>"k", "i"=>"l", "j"=>"m", "k"=>"n", "l"=>"o", "m"=>"p", "n"=>"q", "o"=>"r", "p"=>"s", "q"=>"t", "r"=>"u", "s"=>"v", "t"=>"w", "u"=>"x", "v"=>"y", "w"=>"z", "x"=>"0", "y"=>"1", "z"=>"2", "0"=>"3", "1"=>"4", "2"=>"5", "3"=>"6", "4"=>"7", "5"=>"8", "6"=>"9", "7"=>" ", "8"=>".", "9"=>",", " "=>"a", "."=>"b", ","=>"c"}, {"a"=>"f", "b"=>"g", "c"=>"h", "d"=>"i", "e"=>"j", "f"=>"k", "g"=>"l", "h"=>"m", "i"=>"n", "j"=>"o", "k"=>"p", "l"=>"q", "m"=>"r", "n"=>"s",...
    #@encrypt_message = EncryptMessage.new("test", @encryption_hashes).encrypt
  end                                                              # => :initialize

  def encrypt(message)
    EncryptMessage.new(message, @encryption_hashes).encrypt  # => "zkntdvysoql"
  end                                                        # => :encrypt

  def decrypt()
  end            # => :decrypt

end  # => :decrypt


e = Enigma.new            # => #<Enigma:0x007fd1e118b8d8 @key=84035, @encryption_hashes=[{"a"=>"g", "b"=>"h", "c"=>"i", "d"=>"j", "e"=>"k", "f"=>"l", "g"=>"m", "h"=>"n", "i"=>"o", "j"=>"p", "k"=>"q", "l"=>"r", "m"=>"s", "n"=>"t", "o"=>"u", "p"=>"v", "q"=>"w", "r"=>"x", "s"=>"y", "t"=>"z", "u"=>"0", "v"=>"1", "w"=>"2", "x"=>"3", "y"=>"4", "z"=>"5", "0"=>"6", "1"=>"7", "2"=>"8", "3"=>"9", "4"=>" ", "5"=>".", "6"=>",", "7"=>"a", "8"=>"b", "9"=>"c", " "=>"d", "."=>"e", ","=>"f"}, {"a"=>"d", "b"=>"e", "c"=>"f", "d"=>"g", "e"=>"h", "f"=>"i", "g"=>"j", "h"=>"k", "i"=>"l", "j"=>"m", "k"=>"n", "l"=>"o", "m"=>"p", "n"=>"q", "o"=>"r", "p"=>"s", "q"=>"t", "r"=>"u", "s"=>"v", "t"=>"w", "u"=>"x", "v"=>"y", "w"=>"z", "x"=>"0", "y"=>"1", "z"=>"2", "0"=>"3", "1"=>"4", "2"=>"5", "3"=>"6", "4"=>"7", "5"=>"8", "6"=>"9", "7"=>" ", "8"=>".", "9"=>",", " "=>"a", "."=>"b", ","=>"c"}, {"a"=>"f", "b"=>"g", "c"=>"h", "d"=>"i", "e"=>"j", "f"=>"k", "g"=>"l", "h"=>"m", "i"=>"n", "j"=>"o", "k"=>"p", "l"=>"q", "m"...
e.encrypt("this string")  # => "zkntdvysoql"
