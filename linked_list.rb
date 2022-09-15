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

  #This method adds a new node containing the 'value'
  #to the start of the list.
  def append(value)
    new_node = Node.new(value)
    new_node.next_node = head
    self.head = new_node
  end

  #This method adds a new node with 'value' to the end
  #of the list.
  def prepend(value)
    new_node = Node.new(value)
    tail.next_node = new_node
  end

  #This method returns the size of list
  def size
    size = 0
    current_node = head
    while current_node
      current_node = current_node.next_node
      size += 1
    end
    return size
  end

  #This method returns the tails of the linked list
  #(i.e., The last node in the list).
  def tail
    current_node = head
    while current_node
      current_node = current_node.next_node
      if current_node.next_node == nil
        return current_node
      end
    end
  end

  #This method returns the node.value at given index
  def at(index)
    current_index = 0
    current_node = head
    while current_node
      if current_index == index
        return current_node.value
      end
      current_index += 1
      current_node = current_node.next_node
    end
  end

  #This method removes the last node from the list
  #and returns the node removed from the list.
  def pop
    current_node = head
    # Last node stays one step ahead of the current_node.
    while current_node
      last_node = current_node.next_node
      if last_node.next_node == nil
        current_node.next_node = nil
        return last_node
      else
        current_node = current_node.next_node
      end
    end
  end

  #This method returns true if the list contains
  #the value given. Else, returns false.
  def contains?(value)
    current_node = head
    while current_node
      if current_node.value == value
        return true
      else
        current_node = current_node.next_node
      end
    end
    return false
  end

  #This method returns the index of value given. Else,
  #returns nil.
  def find(value)
    current_index = 0
    current_node = head
    while current_node
      if current_node.value == value
        return current_index
      else
        current_node = current_node.next_node
        current_index += 1
      end
    end
  end

  #This method returns list as a string so user can
  #print it to their console.
  def to_s
    current_node = head
    output = ""
    while current_node
      if current_node.next_node == nil
        output +=  "( #{current_node.value} ) -> nil"
        break
      else
        output += "( #{current_node.value} ) -> "
        current_node = current_node.next_node
      end
    end
    return output
  end

  #This method inserts a new node into the index
  #specified.
  def insert_at(value, index)
    new_node = Node.new(value)
    #All we need is the node that comes before the
    #index we want to insert our new node at.
    previous_node_index = index - 1
    current_index = 0
    current_node = head
    while current_node
      if current_index == previous_node_index
        new_node.next_node = current_node.next_node
        current_node.next_node = new_node
        break
      else
        current_index += 1
        current_node = current_node.next_node
      end
    end
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
# my_list.append(0)
my_list.prepend(5)
my_list.at(3)
puts my_list.to_s


