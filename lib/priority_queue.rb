# frozen_string_literal: true

# This class represents a priority queue, which is a data structure that
# allows for efficient access to the minimum (or maximum) element in a
# collection of elements. The priority queue is implemented as a binary
# heap, which is a complete binary tree that satisfies the heap property.
# The heap property states that the key of a node is less than or equal to
# the keys of its children. This implementation uses a binary min-heap.
class PriorityQueue
  attr_accessor :heap

  def initialize
    @heap = []
  end

  # This method adds an element to the priority queue.
  def push(element)
    @heap << element
    bubble_up(@heap.size - 1)
  end

  # This method removes and returns the minimum element from the priority
  # queue.
  def pop
    return nil if @heap.empty?

    swap(0, @heap.size - 1)
    min = @heap.pop
    bubble_down(0)
    min
  end

  # This method returns the minimum element in the priority queue.
  def peek
    @heap.first
  end

  # This method returns the number of elements in the priority queue.
  def size
    @heap.size
  end

  # This method returns true if the priority queue is empty and false
  # otherwise.
  def empty?
    @heap.empty?
  end

  # search method returns the index of an element in the priority queue.
  def search(element)
    @heap.each_with_index do |el, index|
      return index if el == element
    end
    -1
  end

  # This method clears all elements from the priority queue.
  def clear
    @heap = []
  end

  private

  def bubble_up(index)
    parent = (index - 1) / 2

    return if index.zero? || @heap[parent] <= @heap[index]

    swap(index, parent)
    bubble_up(parent)
  end

  def bubble_down(index)
    left = 2 * index + 1
    right = 2 * index + 2
    smallest = index

    smallest = left if left < @heap.size && @heap[left] < @heap[smallest]
    smallest = right if right < @heap.size && @heap[right] < @heap[smallest]

    return if smallest == index

    swap(index, smallest)
    bubble_down(smallest)
  end

  def swap(i, j)
    @heap[i], @heap[j] = @heap[j], @heap[i]
  end
end
