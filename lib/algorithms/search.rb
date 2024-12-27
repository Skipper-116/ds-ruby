# frozen_string_literal: true

# module Algorithms
module Algorithms
  # this class is a search algorithm implementation
  class Search
    def self.linear(array, data)
      array.each_with_index do |value, index|
        return index if value == data
      end
      -1
    end

    # rubocop:disable Metrics/MethodLength
    def self.binary(array, data)
      low = 0
      high = array.size - 1

      while low <= high
        mid = (low + high) / 2
        return mid if array[mid] == data

        if array[mid] < data
          low = mid + 1
        else
          high = mid - 1
        end
      end
      -1
    end
    # rubocop:enable Metrics/MethodLength
  end
end
