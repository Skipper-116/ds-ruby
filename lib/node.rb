# frozen_string_literal: true


# This class will be used in a linked List. It represents a single node in the list.
class Node
  attr_accessor :value, :next, :prev

  def initialize(value)
    @prev = nil
    @value = value
    @next = nil
  end

  def to_s
    value.to_s
  end
end
