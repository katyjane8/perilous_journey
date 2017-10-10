require_relative 'node'
require 'pry'

class LinkedList
  attr_accessor :head
  def initialize(head = nil)
    @head = head
    @node_count = 0
  end

  def tail?(current_node)
    current_node.next_node.nil?
  end

  def before_tail?(node)
    node.next_node.next_node.nil?
  end

  def append(surname, supplies = {})
    if @head.nil?
      @head = Node.new(surname, supplies)
    else
      current = @head
      until current.next_node.nil?
        current = current.next_node
      end
      current.next_node = Node.new(surname, supplies)
    end
  end

  def count
  current_node = @head
    until current_node.nil?
      @node_count += 1
      current_node = current_node.next_node
    end
    @node_count
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

  def prepend(surname, supplies = nil)
    node = Node.new(surname)
    if @head == nil
      @head = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def insert(index, surname, supplies = nil)
    return nil if @head == nil
    current_node = @head
    (index-1).times do
      current_node = current_node.next_node
    end
    new_node = Node.new(surname)
    new_node.next_node = current_node.next_node
    current_node.next_node = new_node
  end

  #refactor here - clean this up
  def find(position, elements)
    current_node = @head
    return nil if @head == nil
    position.times do
      current_node = current_node.next_node
    end
    family_string = "The #{current_node.surname} family"
    until current_node.next_node.nil?
      family_string << ", followed by the #{current_node.next_node.surname} family"
      current_node = current_node.next_node
    end
    family_string
  end

  def includes?(value, node = @head)
    if node.surname == value
      true
    elsif node.next_node.nil?
      false
    else
      includes?(value, node.next_node)
    end
  end

  def pop(node = @head)
    dead = node.next_node.next_node.nil?
    if dead
      killed = node.next_node
      node.next_node = nil
      puts "The #{killed.surname} family has died of dysentery"
      killed
    else
      pop(node.next_node)
    end
  end

end
