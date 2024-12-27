# frozen_string_literal: true

require_relative 'node'

# This class in a doubly linked list implementation and uses the node class
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # Add a node to the end of the list
  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      @tail.next = node
      node.prev = @tail
    end
    @tail = node
  end

  # Insert a node anywhere in the list
  def insert(value, index)
    node = Node.new(value)
    current = @head
    i = 0
    while i < index
      current = current.next
      i += 1
    end
    node.prev = current.prev
    node.next = current
    current.prev.next = node
    current.prev = node
  end

  # Remove a node from the list
  def remove(value)
    current = @head
    until current.nil?
      if current.value == value
        current.prev.next = current.next
        current.next.prev = current.prev
        return
      end
      current = current.next
    end
  end

  # Search for a node in the list
  # Returns the index of the node if found, otherwise returns -1
  def search(value)
    current = @head
    index = 0
    until current.nil?
      return index if current.value == value

      current = current.next
      index += 1
    end
    -1
  end

  # Check if the list contains a node
  # Returns true if the node is found, otherwise returns false
  def include?(value)
    current = @head
    until current.nil?
      return true if current.value == value

      current = current.next
    end

    false
  end

  # Clear the list of all nodes
  def clear
    @head = nil
    @tail = nil
  end
end
