# frozen_string_literal: true

module Algorithms
  # Sort Algortims
  class Sort
    # Bubble sort
    # rubocop:disable Metrics/MethodLength
    def self.bubble(array)
      n = array.size
      loop do
        swapped = false
        (n - 1).times do |i|
          if array[i] > array[i + 1]
            array[i], array[i + 1] = array[i + 1], array[i]
            swapped = true
          end
        end
        break unless swapped
      end
    end
    # rubocop:enable Metrics/MethodLength
  end
end
