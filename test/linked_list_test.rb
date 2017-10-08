require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/emoji'
require './lib/node'
require './lib/linked_list'

class LinkedListTest < Minitest::Test
  def test_linked_list_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_linked_list_head_is_nil
    list = LinkedList.new

    assert_nil list.head
  end

  def test_first_node_can_change
    list = LinkedList.new

    assert_instance_of Node, list.append("West")
  end

  def test_linked_list_holds_instance_of_node
    list = LinkedList.new("West")

    assert_instance_of LinkedList, list
  end

  def test_node_after_head_is_nil
    list = LinkedList.new
    list.append("West")

    assert_nil list.head.next_node
  end

  def test_list_has_a_count
    list = LinkedList.new
    list.append("West")

    assert_equal 1, list.count
  end

  def test_list_can_be_string
    list = LinkedList.new
    list.append("West")

    assert_equal "The West family", list.to_string
  end
end
