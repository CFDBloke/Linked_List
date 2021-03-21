# frozen_string_literal: true

# The linked list class
class LinkedList
  attr_reader :length

  def initialize
    @head = nil
    @length = 0
  end

  def print_list
    temp_node = @head
    print '|'
    loop do
      print " #{temp_node.value} |"
      break if temp_node.next_node.nil?

      temp_node = temp_node.next_node
    end
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      temp_node = @head
      temp_node = temp_node.next_node until temp_node.next_node.nil?
      temp_node.next_node = Node.new(value)
    end
    @length += 1
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
    else
      temp_node = @head
      @head = Node.new(value, temp_node)
    end
    @length += 1
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

puts list.print_list
