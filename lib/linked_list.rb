require_relative 'node'
require 'pry'

class LinkedList
  attr_accessor :head
  def initialize(head = nil)
    @head = head
    @count = 0
  end

  def append(surname)
    if @head == nil
      @head = Node.new(surname)
    else
      @head.next_node.nil?
      @head.next_node = Node.new(surname)
    end
  end

  def count
  current_node = @head
    until current_node.nil?
      @count += 1
      current_node = current_node.next_node
    end
    @count
  end

  def to_string
    current_node = @head
    family_list = "The #{head.surname} family"
    until current_node.next_node.nil?
      current_node = current_node.next_node
      family_list << ", followed by the #{current_node.surname} family"
    end
    family_list
  end

end
