#I built a linked list application in an OOP paradigm, using Ruby objects:

#Node class, used to build new nodes:
class Node
  attr_accessor :data, :next
  
  def initialize(data = nil)
    @data = data
    @next = nil
  end
end

#LinkedList class, representing the full list:
class LinkedList
  attr_accessor :name
  
  def initialize
    @head = nil
    @tail = nil
  end
 
#adds a new node to the end of the list.
  def append(data)
    node = Node.new(data)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next = node
      @tail = node
    end
  end
  
#adds a new node to the start of the list.
  def prepend(data)
    node = Node.new(data)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next = @head
      @head = node
    end
  end
  
#returns the total number of nodes in the list.
  def size
    return 0 if @head.nil?
    number_of_nodes = 0
    current_node = @head
    while !node.nil? do
      number_of_nodes += 1
      current_node = node.next
    end
    number_of_nodes
  end
  
#returns the first node in the list.  
  def head
    return nil if @head.nil?
    @head.data
  end
  
#returns the last node in the list.  
  def tail
    return nil if @head.nil?
    @tail.data
  end
  
#returns the node at a given index.  
  def at(index)
    return nil if @head.nil? || index > self.size - 1
    current_node = @head
    (index).times do
      current_node = current_node.next
    end
    current_node.data
  end
  
#removes the last element of the list.
  def pop
    return nil if @head.nil? || self.size == 0
    current_node = @head
    prev_node = nil
    (self.size - 1).times do
      prev_node = current_node
      current_node = current_node.next
    end
    current_node = nil
    @tail = prev_node
  end
  
#returns true if the passed-in value is in the list and otherwise returns false.  
  def contains?(value)
    found = false
    current_node = @head
    while !node.nil? do
      if node.data == value
        found = true
        break
      end
      current_node = node.next
    end
    found
  end
  
#returns the index of the node containing a given value, or nil if not found.
  def find(value)
    return nil if @head.nil?
    found = nil
    index = 0
    current_node = @head
    while !node.nil? do
      if node.data == value
        found = true
        break
      end
      index += 1
      current_node = node.next
    end
    found == true ? "#{value} found at index #{index}!" : nil
  end
  
#represents all linked-list objects as strings, so we can print them out and preview them in the console.  
  def to_s
    return nil if @head.nil?
    full_list = []
    current_node = @head
    until current_node.nil? do
      full_list << current_node.data
      current_node = node.next
    end
    puts "( #{full_list.join(" ) -> ( ")} ) -> nil "
  end
  
#inserts a new node at a given index.
  def insert_at(index,data)
    return nil if @head.nil? || index > self.size - 1
    if index == 0
      self.prepend(data)
    elsif index == self.size - 1
      self.append(data)
    else
      new_node = Node.new(data)
      current_node = @head
      prev_node = nil
      index.times do
        prev_node,current_node = current_node,current_node.next
      end
    end
    new_node.next,prev.next = current_node,new_node    
  end

#removes the node at a given index.
  def remove_at(index)
    return nil if @head.nil? || index > self.size - 1
    if index == 0
      @head = @head.next
    elsif index == self.size - 1
      self.pop(node)
    else
      current_node = @head
      prev_node = nil
      index.times do
        prev_node,current_node = current_node,current_node.next
      end
    end
    prev_node.next = current_node.next
  end
  
end