# frozen_string_literal: true

# The linked list class
class LinkedList
  attr_reader :size, :head

  def initialize
    @head = nil
    @size = 0
    @node_pointer = @head
  end

  def to_s
    temp_node = @head
    loop do
      print " ( #{temp_node.value} ) ->"
      break if temp_node.next_node.nil?

      temp_node = temp_node.next_node
    end
    print ' nil'
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      move_pointer_to(@size - 1)
      @node_pointer.next_node = Node.new(value)
    end
    @size += 1
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
    else
      temp_node = @head
      @head = Node.new(value, temp_node)
    end
    @size += 1
  end

  def tail
    move_pointer_to(@size - 1)
    @node_pointer
  end

  def at(index)
    temp_node = @head
    index.times { temp_node = temp_node.next_node }
    temp_node
  end

  def pop
    temp_node = @head
    (@size - 2).times { temp_node = temp_node.next_node }
    temp_node.next_node = nil
    @size -= 1
  end

  def contains?(value)
    temp_node = @head
    @size.times do
      return true if temp_node.value == value

      temp_node = temp_node.next_node
    end
    false
  end

  def find(value)
    i = 0
    @node_pointer = @head
    while @node_pointer.value != value
      @node_pointer = @node_pointer.next_node
      i += 1
      return nil if @node_pointer.next_node.nil?
    end
    i
  end

  def insert_at(value, index)
    if index.zero?
      prepend(value)
      return
    end
    move_pointer_to(index - 1)

    temp_next_node = @node_pointer.next_node
    @node_pointer.next_node = Node.new(value, temp_next_node)
  end

  def remove_at(index)
    if index.zero?
      @head = @head.next_node
      return
    end
    move_pointer_to(index - 1)
    @node_pointer.next_node = @node_pointer.next_node.next_node
  end

  private

  def move_pointer_to(index)
    @node_pointer = @head
    index.times { @node_pointer = @node_pointer.next_node }
  end
end

# The node class representing an element in the linked list
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new

list.append(1)
list.prepend(45)
list.prepend(8)
list.append(34)
list.append(376)
list.prepend(29)

puts 'This is the linked list as it current stands...'
puts list.to_s
puts "The linked list consists of #{list.size} elements"
puts "The value in the head node of the linked list is #{list.head.value}"
puts "The value in the tail node of the linked list is #{list.tail.value}"
puts "The value at linked list position 3 is #{list.at(3).value}"
puts 'This is the linked list with the tail value popped off...'

list.pop
puts list.to_s
puts "Does the linked list contain the number 29?... #{list.contains?(29)}"
puts "The value of 45 found at index #{list.find(45)}"
puts "The value of 376 cannot be found in the linked list? #{list.find(376).nil?}"
puts 'This is what the linked list looks like when a value of 578 is inserted at index 1...'
list.insert_at(578, 1)
puts list.to_s
puts 'This is what the linked list looks like value at index 0 is removed...'
list.remove_at(0)
puts list.to_s
puts 'This is what the linked list looks like when a string value is appended to it...'
list.append('Hello World!')
puts list.to_s
puts "This is what the linked list looks like when a node object with value 'This is cool!' is prepended to it..."
list.prepend(Node.new('This is cool!'))
puts list.to_s
