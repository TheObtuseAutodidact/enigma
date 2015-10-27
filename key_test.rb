# require "./key.rb"
# require "minitest"
# require "minitest/autorun"
#
# class KeyTest < Minitest::Test
#
#   def test_it_exists
#     assert Key
#   end
#
#   def test_new_object_is_a_class_of_key
#     assert Key.new.is_a?(Key)
#   end
#
#   def test_new_key_array_contains_four_items
#     key = Key.new
#     assert_equal 4, key.generate_key.length
#   end
#
#   def test_key_elements_are_string_items
#     key = Key.new
#
#     assert key.generate_key[0].is_a?(String)
#     assert key.generate_key[1].is_a?(String)
#     assert key.generate_key[2].is_a?(String)
#     assert key.generate_key[3].is_a?(String)
#   end

  # def test_it_has_a_char_set_of_39_chars
  #   key = Key.new
  #   assert_equal 39, key.char_set.length
  # end
  #
  # def test_it_can_take_5_digit_num_and_split_digits_into_4_sets_of_2
  #   key = Key.new
  #   key.cypher_array
  #   assert_equal 12, key.cypher_array[0]
  #   assert_equal 23, key.cypher_array[1]
  #   assert_equal 34, key.cypher_array[2]
  #   assert_equal 45, key.cypher_array[3]
  # end
  #
  # def test_it_generates_todays_date_as_a_formated_string
  #   key = Key.new
  #   assert_equal Time.now.strftime("%m%d%y"), key.date_string
  # end
  #
  # def test_it_formats_date_string_to_add_to_cypher_array
  #   key = Key.new
  #   key.current_array
  #   key.rot_array(date_string)
  #   assert_equal 13, key.cypher_array[0]
  # end



# end
