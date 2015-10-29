class Key
  attr_reader :key

  def initialize(key=rand(10000..99999))
    @key = key
  end

end

k = Key.new
key=Key.new(12345)
