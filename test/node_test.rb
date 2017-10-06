require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  def test_node_exists
    node = Node.new("Burke")

    assert_instance_of Node, node
  end

  def test_if_has_surname
    node = Node.new("Burke")

    assert_equal "Burke", node.surname
  end

  def test_if_next_node_is_nil_by_default
    node = Node.new("Hoops")

    assert_nil node.next_node
  end
end
