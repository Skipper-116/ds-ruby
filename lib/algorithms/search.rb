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
  end
end
