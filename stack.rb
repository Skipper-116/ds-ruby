# frozen_string_literal: true

# Stack class
class Stack
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(value)
    stack.push(value)
  end

  def pop
    raise 'Stack is empty' if stack.empty?

    stack.pop
  end

  def peek
    stack.last
  end

  def size
    stack.size
  end

  def search(value)
    result = stack.index(value)
    result || -1
  end

  def clear
    stack.clear
  end

  def empty?
    stack.empty?
  end
end
