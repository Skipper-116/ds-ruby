# frozen_string_literal: true

module Ds
  # this class is a dynamic array implementation
  class DynamicArray
    attr_accessor :array, :capacity, :size

    def initialize(capacity = 10)
      @capacity = capacity
      @array = Array.new(capacity)
      @size = 0
    end

    def add(value)
      grow if size >= capacity
      @array[size] = value
      @size += 1
    end

    def insert(index, data)
      return if index.negative? || index >= capacity

      grow if size >= capacity
      i = size
      while i > index
        @array[i] = @array[i - 1]
        i -= 1
      end
      @array[index] = data
      @size += 1
    end

    def delete(data)
      index = search(data)
      return if index.negative?

      i = index
      while i < size
        @array[i] = @array[i + 1]
        i += 1
      end
      @size -= 1
      shrink if size <= capacity / 3
    end

    def search(data)
      @array.each_with_index do |value, index|
        return index if value == data
      end
      -1
    end

    def empty?
      @array.empty?
    end

    def to_s
      @array
    end

    private

    def grow
      @capacity *= 2
      new_array = Array.new(@capacity)
      @array.each_with_index { |value, index| new_array[index] = value }
      @array = new_array
    end

    def shrink
      @capacity /= 2
      new_array = Array.new(@capacity)
      @array.each_with_index { |value, index| new_array[index] = value }
      @array = new_array
    end
  end
end
