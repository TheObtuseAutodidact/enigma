# class Key
#
#   ##########################  generating Key (make class)  #################################
#   def generate_key
#
#     crypto_key = 12345#rand(10000..99999)         # => 65479
#     crypto_key = crypto_key.to_s.split("")
#     a = crypto_key[0..1].join("").to_i
#     b = crypto_key[1..2].join("").to_i
#     c = crypto_key[2..3].join("").to_i
#     d = crypto_key[3..4].join("").to_i
#
#     #today = 010115.split("")#Time.now.strftime("%m%d%y").to_s.split("")                  # => ["1", "0", "2", "5", "1", "5"]
#     # today = (010115**2).to_s
#     # e = today[0..1].reduce{ |first, second| first.to_i + second.to_i }  # => 1
#     # f = today[1..2].reduce{ |first, second| first.to_i + second.to_i }  # => 1
#     # g = today[2..3].reduce{ |first, second| first.to_i + second.to_i }  # => 1
#     # h = today[3..4].reduce{ |first, second| first.to_i + second.to_i }  # => 2
#     #
#     # a += e  # => 13
#     # b += f  # => 24
#     # c += g  # => 35
#     # d += h  # => 47
#
#   @key_rotation = [a, b, c, d]
#   @key_rotation = @key_rotation.map { |num| num.to_s }
#
#   return @key_rotation
#
#   end
#
#
# end
#
# Key.new.generate_key
