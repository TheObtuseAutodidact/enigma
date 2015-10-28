require_relative './key1'  # => true

class OffsetsCalc
  attr_reader :key, :date  # => nil

  def initialize(key, date)
    @key = key
    @date = date.strftime("%m%d%Y").to_i
  end                                     # => :initialize

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
  end                            # => :parse_key

  def parse_offsets
    date = (@date ** 2).to_s.split("")[-4..-1]
    date = date.map { |num| num.to_i }
    return date
  end                                           # => :parse_offsets

  def offsets
    offsets = parse_key.zip(parse_offsets)
    offsets = offsets.map do |offset|
      offset.reduce(:+)
    end
    return offsets
  end                                       # => :offsets
end                                         # => :offsets

# oc = OffsetsCalc.new(12345, "011115")  # => #<OffsetsCalc:0x007fc04c879fb0 @key=12345, @date=11115>
# oc.offsets                             # => [15, 25, 36, 50]
