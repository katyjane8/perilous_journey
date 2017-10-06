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
    list = LinkedList.new("West")
    assert_equal , list.append("West")
  end

  def test_linked_list_holds_instance_of_node
    list = LinkedList.new("West")
    assert_instance_of LinkedList, list
  end

  def test_node_after_head_is_nil
    list = LinkedList.new("West")
    assert_nil list.head.next_node
  end

# > list.count
# => 1
# > list.to_string
# => "The West family"
end
