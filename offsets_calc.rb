
require_relative './key1'  # => true

class OffsetsCalc
  attr_reader :key, :date  # => nil

  def initialize(key=Key.new, date=Time.now.strftime("%m%d%y").to_i)
    @key = key                                                        # => 12345, 12345
    @date = date.to_i                                                 # => 102815, 111115
  end                                                                 # => :initialize

  def parse_key
    pre_offsets = []             # => [], []
    key = @key.to_s.split("")    # => ["1", "2", "3", "4", "5"], ["1", "2", "3", "4", "5"]
    a = key[0..1].join("").to_i  # => 12, 12
    pre_offsets << a             # => [12], [12]
    b = key[1..2].join("").to_i  # => 23, 23
    pre_offsets << b             # => [12, 23], [12, 23]
    c = key[2..3].join("").to_i  # => 34, 34
    pre_offsets << c             # => [12, 23, 34], [12, 23, 34]
    d = key[3..4].join("").to_i  # => 45, 45
    pre_offsets << d             # => [12, 23, 34, 45], [12, 23, 34, 45]
    return pre_offsets           # => [12, 23, 34, 45], [12, 23, 34, 45]
  end                            # => :parse_key

  def parse_offsets
    date = (@date ** 2).to_s.split("")[-4..-1]  # => ["4", "2", "2", "5"], ["3", "2", "2", "5"]
    date = date.map { |num| num.to_i }          # => [4, 2, 2, 5], [3, 2, 2, 5]
    return date                                 # => [4, 2, 2, 5], [3, 2, 2, 5]
  end                                           # => :parse_offsets

  def offsets
    offsets = parse_key.zip(parse_offsets)  # => [[12, 4], [23, 2], [34, 2], [45, 5]], [[12, 3], [23, 2], [34, 2], [45, 5]]
    offsets = offsets.map do |offset|       # => [[12, 4], [23, 2], [34, 2], [45, 5]], [[12, 3], [23, 2], [34, 2], [45, 5]]
      offset.reduce(:+)                     # => 16, 25, 36, 50, 15, 25, 36, 50
    end                                     # => [16, 25, 36, 50], [15, 25, 36, 50]
    return offsets                          # => [16, 25, 36, 50], [15, 25, 36, 50]
  end                                       # => :offsets
end                                         # => :offsets

 oc = OffsetsCalc.new(12345)           # => #<OffsetsCalc:0x007fc9fc084cd8 @key=12345, @date=102815>
 oc.offsets                            # => [16, 25, 36, 50]
 oc2 = OffsetsCalc.new(12345, 111115)  # => #<OffsetsCalc:0x007fc9fc074360 @key=12345, @date=111115>
 oc2.offsets                           # => [15, 25, 36, 50]
