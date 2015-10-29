require_relative'./encryption_hashes'  # => true

class EncryptMessage
  attr_reader :encryptors  # => nil
  attr_accessor :message   # => nil

  def initialize(message, encryption_hashes)
    @message = message                        # => "test"
    @encryptors = encryption_hashes           # => [{"a"=>"b", "b"=>"c", "c"=>"d", "d"=>"e", "e"=>"f", "f"=>"g", "g"=>"h", "h"=>"i", "i"=>"j", "j"=>"k", "k"=>"l", "l"=>"m", "m"=>"n", "n"=>"o", "o"=>"p", "p"=>"q", "q"=>"r", "r"=>"s", "s"=>"t", "t"=>"u", "u"=>"v", "v"=>"w", "w"=>"x", "x"=>"y", "y"=>"z", "z"=>"0", "0"=>"1", "1"=>"2", "2"=>"3", "3"=>"4", "4"=>"5", "5"=>"6", "6"=>"7", "7"=>"8", "8"=>"9", "9"=>" ", " "=>".", "."=>",", ","=>"a"}, {"a"=>"c", "b"=>"d", "c"=>"e", "d"=>"f", "e"=>"g", "f"=>"h", "g"=>"i", "h"=>"j", "i"=>"k", "j"=>"l", "k"=>"m", "l"=>"n", "m"=>"o", "n"=>"p", "o"=>"q", "p"=>"r", "q"=>"s", "r"=>"t", "s"=>"u", "t"=>"v", "u"=>"w", "v"=>"x", "w"=>"y", "x"=>"z", "y"=>"0", "z"=>"1", "0"=>"2", "1"=>"3", "2"=>"4", "3"=>"5", "4"=>"6", "5"=>"7", "6"=>"8", "7"=>"9", "8"=>" ", "9"=>".", " "=>",", "."=>"a", ","=>"b"}, {"a"=>"d", "b"=>"e", "c"=>"f", "d"=>"g", "e"=>"h", "f"=>"i", "g"=>"j", "h"=>"k", "i"=>"l", "j"=>"m", "k"=>"n", "l"=>"o", "m"=>"p", "n"=>"q", "o"=>"r", "p"=>"s", ...
  end                                         # => :initialize

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
  end                                                       # => :encrypt

end  # => :encrypt

em = EncryptMessage.new("test", EncryptionHashes.new([1,2,3,4]).encryptors)  # => #<EncryptMessage:0x007fa842030628 @message="test", @encryptors=[{"a"=>"b", "b"=>"c", "c"=>"d", "d"=>"e", "e"=>"f", "f"=>"g", "g"=>"h", "h"=>"i", "i"=>"j", "j"=>"k", "k"=>"l", "l"=>"m", "m"=>"n", "n"=>"o", "o"=>"p", "p"=>"q", "q"=>"r", "r"=>"s", "s"=>"t", "t"=>"u", "u"=>"v", "v"=>"w", "w"=>"x", "x"=>"y", "y"=>"z", "z"=>"0", "0"=>"1", "1"=>"2", "2"=>"3", "3"=>"4", "4"=>"5", "5"=>"6", "6"=>"7", "7"=>"8", "8"=>"9", "9"=>" ", " "=>".", "."=>",", ","=>"a"}, {"a"=>"c", "b"=>"d", "c"=>"e", "d"=>"f", "e"=>"g", "f"=>"h", "g"=>"i", "h"=>"j", "i"=>"k", "j"=>"l", "k"=>"m", "l"=>"n", "m"=>"o", "n"=>"p", "o"=>"q", "p"=>"r", "q"=>"s", "r"=>"t", "s"=>"u", "t"=>"v", "u"=>"w", "v"=>"x", "w"=>"y", "x"=>"z", "y"=>"0", "z"=>"1", "0"=>"2", "1"=>"3", "2"=>"4", "3"=>"5", "4"=>"6", "5"=>"7", "6"=>"8", "7"=>"9", "8"=>" ", "9"=>".", " "=>",", "."=>"a", ","=>"b"}, {"a"=>"d", "b"=>"e", "c"=>"f", "d"=>"g", "e"=>"h", "f"=>"i", "g"=>"...
