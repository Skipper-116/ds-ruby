# frozen_string_literal: true

module Ds
  # This class will be used in a linked List. It represents a single node in the list.
  class Node
    attr_accessor :value, :next, :prev

    def initialize(value)
      @prev = nil
      @value = value
      @next = nil
    end

    def right=(node)
      @next = node
    end

    def left=(node)
      @prev = node
    end

    def right
      @next
    end

    def left
      @prev
    end

    def to_s
      value.to_s
    end
  end
end
