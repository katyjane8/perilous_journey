require_relative 'linked_list'
require_relative 'node'

class WagonTrain
  attr_accessor :list
  def initialize
    @list = LinkedList.new
  end

  def append(surname)
    list.append(surname)
  end

  def count
    list.count
  end

end
