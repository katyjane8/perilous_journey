require_relative 'linked_list'

class WagonTrain
  attr_accessor :list
  def initialize
    @list = LinkedList.new
  end

  def append(surname, supplies = {})
    list.append(surname, supplies)
  end

  def count
    list.count
  end

  def supplies
    current = list.head
    supplies = {}
    until current.nil?
      supplies = supplies.merge(current.supplies) {|supply_name, old_count, new_count| old_count + new_count}
      current = current.next_node
    end
    supplies
  end
end
