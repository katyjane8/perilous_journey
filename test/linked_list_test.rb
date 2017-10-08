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

  def test_head_node_can_change_again
    list = LinkedList.new

    assert_instance_of Node, list.append("Rhodes")
  end

  def test_the_list_has_new_head
    list = LinkedList.new("Rhodes")

    assert_instance_of LinkedList, list
  end

  def test_new_head_is_new_surname
    list = LinkedList.new
    list.append("Rhodes")

    assert_instance_of Node, list.head
  end

  def test_next_node_is_still_nil
    list = LinkedList.new
    list.append("Rhodes")

    assert_nil list.head.next_node
  end

  def test_append_with_even_newer_surname
    list = LinkedList.new

    assert_instance_of Node, list.append("Hardy")
  end

  def test_the_next_node_is_still_nil_with_two_count
    list = LinkedList.new
    list.append("Hardy")

    assert_nil list.head.next_node
  end

  def test_count_for_second_family
    list = LinkedList.new
    list.append("Hardy")
    list.append("Rhodes")

    assert_equal 2, list.count
  end

  def test_new_string_with_two_families_works
    list = LinkedList.new
    list.append("Rhodes")
    list.append("Hardy")

    assert_equal "The Rhodes family, followed by the Hardy family", list.to_string
  end
end
