# frozen_string_literal: true

# Queue class
class Queue
  attr_accessor :queue

  def initialize
    @queue = []
  end

  # Add an element to the queue
  def enqueue(value)
    queue.push(value)
  end

  # Remove an element from the queue
  def dequeue
    raise 'Queue is empty' if queue.empty?

    queue.shift
  end

  # Get the first element in the queue without removing it
  def peek
    raise 'Queue is empty' if queue.empty?

    queue.first
  end

  # Get the size of the queue
  def size
    queue.size
  end

  # Search for an element in the queue and return its index
  def search(value)
    result = queue.index(value)
    result || -1
  end

  # Check if the queue contains an element
  def include?(value)
    queue.include?(value)
  end

  # Clear the queue of all elements
  def clear
    queue.clear
  end

  # Check if the queue is empty
  def empty?
    queue.empty?
  end
end
