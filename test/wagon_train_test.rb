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

end
