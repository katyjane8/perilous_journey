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

  def test_append_for_surname_Brooks
    list = LinkedList.new

    assert_instance_of Node, list.append("Brooks")
    assert_nil list.head.next_node
  end

  def test_to_string_with_Brooks_family
    list = LinkedList.new
    list.append("Brooks")

    assert_equal "The Brooks family", list.to_string
  end

  def test_append_for_surname_Henderson
    list = LinkedList.new

    assert_instance_of Node, list.append("Henderson")
    assert_nil list.head.next_node
  end

  def test_prepend_method
    list = LinkedList.new
    list.append("Brooks")

    assert_instance_of Node, list.prepend("McKinney")
    assert_instance_of Node, list.head.next_node
  end

  def test_string_can_hold_three_families
    list = LinkedList.new
    list.prepend("McKinney")
    list.append("Brooks")
    list.append("Henderson")

    assert_equal "The McKinney family, followed by the Brooks family, followed by the Henderson family", list.to_string
  end

  def test_string_can_count_to_three
    list = LinkedList.new
    list.prepend("McKinney")
    list.append("Brooks")
    list.append("Henderson")

    assert_equal 3, list.count
  end

  def test_insert_method_works
    list = LinkedList.new
    list.prepend("McKinney")
    list.append("Brooks")
    list.append("Henderson")

    assert_instance_of Node, list.insert(1, "Lawson")
  end

  def test_to_string_method_can_count_to_three
    list = LinkedList.new
    list.prepend("McKinney")
    list.append("Brooks")
    list.append("Henderson")
    list.insert(1, "Lawson")

    assert_equal "The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Henderson family", list.to_string
  end

  def test_find_method
    # find takes two parameters, the first indicates the first position to return and the second parameter specifies how many elements to return.
    list = LinkedList.new
    list.prepend("Lawson")
    list.append("Henderson")
    list.append("Brooks")

    assert_equal "The Brooks family", list.find(2, 1)
  end

  def test_find_method_with_different_number_of_elements
    list = LinkedList.new
    list.append("Welyczko")
    list.append("Lawson")
    list.append("Brooks")
    list.append("Henderson")

    assert_equal "The Lawson family, followed by the Brooks family, followed by the Henderson family", list.find(1, 3)
  end

  def test_includes_has_surname_values
    list = LinkedList.new
    list.append("Welyczko")
    list.append("Lawson")
    list.append("Brooks")
    list.append("Henderson")

    assert_equal true, list.includes?("Brooks")
    assert_equal false, list.includes?("Chapman")
  end

  def test_pop_method
    # > list.pop
    # The Henderson family has died of dysentery
  end
  # => <Node surname="Henderson" next_node=nil #5678904567890>
  # > list.pop
  # The Brooks family has died of dysentery
  # => <Node surname="Brooks" next_node=nil #5678904567890>
  # > list.to_string
  # => "The McKinney family, followed by the Lawson family"
end
