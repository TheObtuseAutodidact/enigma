#######################    char array  ####################################

@char_set = ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
############################################################################

##########################  generating Key (make class)  #################################
crypto_key = rand(10000..99999)
crypto_key = crypto_key.to_s.split("")
a = crypto_key[0..1].join("").to_i
b = crypto_key[1..2].join("").to_i
c = crypto_key[2..3].join("").to_i
d = crypto_key[3..4].join("").to_i

#
#  not offset specs 
today = Time.now.strftime("%m%d%y").to_s.split("")
e = today[0..1].reduce{ |first, second| first.to_i + second.to_i }
f = today[1..2].reduce{ |first, second| first.to_i + second.to_i }
g = today[2..3].reduce{ |first, second| first.to_i + second.to_i }
h = today[3..4].reduce{ |first, second| first.to_i + second.to_i }

a += e
b += f
c += g
d += h

#for each letter in a string starting, totate through ("a..d")
@key_rotation = [a, b, c, d]
###################################################################################################

####################  encryptor class ##########################################################
def encrypt(letters)
  counter = 0
  key = @key_rotation
  key.rotate(counter)
  counter += 1
  my_array = letters.split("")
  first_index = my_array.map do |letter|
    @char_set.index(letter)
  end
  first_index[0]
end

encrypt("b")

@char_set.rotate(13)[encrypt("a")]
@char_set.rotate(13)[0]

("a".."z").to_a.rotate(0)
