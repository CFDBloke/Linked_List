# frozen_string_literal: true

# The linked list class
class LinkedList
  attr_reader :size, :head

  def initialize
    @head = nil
    @size = 0
  end

  def to_s
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
      tail_node = find_tail
      tail_node.next_node = Node.new(value)
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
    find_tail
  end

  def at(index)
    temp_node = @head
    index.times do
      temp_node = temp_node.next_node
    end
    temp_node
  end

  private

  def find_tail
    tail_node = @head
    tail_node = tail_node.next_node until tail_node.next_node.nil?
    tail_node
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

puts list.to_s
puts list.size
puts list.head.value
puts list.tail.value
puts list.at(3).value
