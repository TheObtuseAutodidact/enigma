
require_relative './key1'

class OffsetsCalc
  attr_reader :key, :date

  def initialize(key=Key.new, date=Time.now.strftime("%m%d%y").to_i)
    @key = key
    @date = date.to_i
  end

  def parse_key
    pre_offsets = []
    key = @key.to_s.split("")
    a = key[0..1].join("").to_i
    pre_offsets << a
    b = key[1..2].join("").to_i
    pre_offsets << b
    c = key[2..3].join("").to_i
    pre_offsets << c
    d = key[3..4].join("").to_i
    pre_offsets << d
    return pre_offsets
  end

  def parse_offsets
    date = (@date ** 2).to_s.split("")[-4..-1]
    date = date.map { |num| num.to_i }
    return date
  end

  def offsets
    offsets = parse_key.zip(parse_offsets)
    offsets = offsets.map do |offset|
      offset.reduce(:+)
    end
    return offsets
  end
end

 oc = OffsetsCalc.new(12345)
 oc.offsets
 oc2 = OffsetsCalc.new(12345, 111115)
 oc2.offsets
