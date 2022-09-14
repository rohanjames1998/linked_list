class Node

  attr_accessor :value, :next_node
  #When we initialize a new node we set its properties
  #to nil unless specified.
  def initialize(value=nil)
    @value = value

  end
end


class LinkedList

  attr_accessor :head, :tail

  def initialize(node)
    @head = node
  end
  #This method adds a new node containing the value to the start of the list.
  def append(value)
    new_node = Node.new(value)
    new_node.next_node = head
    head = new_node
  end
end


node = Node.new(1)
node_2 = Node.new(2)
node_3 = Node.new(3)
node_4 = Node.new(4)
node.next_node = node_2
node_2.next_node = node_3
node_3.next_node = node_4

my_list = LinkedList.new(node)


