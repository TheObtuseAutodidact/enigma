class Key

  ##########################  generating Key (make class)  #################################
  def generate_key

    crypto_key = rand(10000..99999)         # => 65479
    crypto_key = crypto_key.to_s.split("")  # => ["6", "5", "4", "7", "9"]
    a = crypto_key[0..1].join("").to_i      # => 65
    b = crypto_key[1..2].join("").to_i      # => 54
    c = crypto_key[2..3].join("").to_i      # => 47
    d = crypto_key[3..4].join("").to_i      # => 79

    today = Time.now.strftime("%m%d%y").to_s.split("")                  # => ["1", "0", "2", "5", "1", "5"]
    e = today[0..1].reduce{ |first, second| first.to_i + second.to_i }  # => 1
    f = today[1..2].reduce{ |first, second| first.to_i + second.to_i }  # => 2
    g = today[2..3].reduce{ |first, second| first.to_i + second.to_i }  # => 7
    h = today[3..4].reduce{ |first, second| first.to_i + second.to_i }  # => 6

    a += e  # => 66
    b += f  # => 56
    c += g  # => 54
    d += h  # => 85

  @key_rotation = [a, b, c, d]                          # => [66, 56, 54, 85]
  @key_rotation = @key_rotation.map { |num| num.to_s }  # => ["66", "56", "54", "85"]

  return @key_rotation  # => ["66", "56", "54", "85"]

  end  # => :generate_key


end  # => :generate_key

Key.new.generate_key  # => ["66", "56", "54", "85"]
