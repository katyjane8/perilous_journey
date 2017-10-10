require 'minitest/autorun'
require 'minitest/emoji'
require './lib/node'
require './lib/linked_list'
require './lib/wagon_train'

class WagonTrainTest < Minitest::Test
  def test_wagon_train_exists
    wt = WagonTrain.new

    assert_instance_of WagonTrain, wt
  end

  def test_wagon_train_list_exists
    wt = WagonTrain.new

    assert_instance_of LinkedList, wt.list
  end

  def test_wagon_train_head_is_nil
    wt = WagonTrain.new

    assert_nil wt.list.head
  end

  def test_append_within_wagon_train
    wt = WagonTrain.new

    assert_instance_of Node, wt.append("Burke")
  end

  def test_head_of_list_is_given_surname
    wt = WagonTrain.new
    wt.append("Burke")

    assert_equal "Burke", wt.list.head.surname
  end

  def test_append_within_wagon_train_with_new_surname
    wt = WagonTrain.new

    assert_instance_of Node, wt.append("West")
    assert_nil wt.list.head.next_node
  end

  def test_list_has_a_count
    wt = WagonTrain.new
    wt.append("West")
    wt.append("Burke")

    assert_equal 2, wt.count
  end

 def test_append_works_with_supplies
   wt = WagonTrain.new

   assert_instance_of Node, wt.append("Burke", {"pounds of food" => 200})
 end

 def test_prepend_works_with_supplies
   wt = WagonTrain.new

   assert_instance_of Node, wt.list.prepend("Hardy", {"spare wagon tongues" => 3})
 end

 def test_insert_works_with_supplies
   wt = WagonTrain.new
   wt.append("Burke", {"pounds of food" => 200})
   wt.append("Hardy", {"spare wagon tongues" => 3})

   assert_instance_of Node, wt.list.insert(1, "West", {"pounds of food" => 300})
 end

 def test_count_wagons_that_have_supplies
   wt = WagonTrain.new
   wt.append("Burke", {"pounds of food" => 200})
   wt.append("Hardy", {"spare wagon tongues" => 3})
   wt.append("West", {"pounds of food" => 300})

   assert_equal 3, wt.count
 end

 def test_supplies_keys_return_correctly
   wt = WagonTrain.new
   wt.append("Burke", {"pounds of food" => 200})
   wt.append("Hardy", {"spare wagon tongues" => 3})
   wt.append("West", {"pounds of food" => 300})
   # > wt.supplies
   # => {"spare wagon tongues" => 3, "pounds of food" => 500}

   assert_equal ({"spare wagon tongues" => 3, "pounds of food" => 500}), wt.supplies
 end

end
