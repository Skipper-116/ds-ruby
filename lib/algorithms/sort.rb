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

    def self.selection(array)
      size = array.size - 1

      size.times do |i|
        j = i + 1
        break if i == size

        (j..size).each do |k|
          array[i], array[k] = array[k], array[i] if array[i] > array[k]
        end
      end
    end
    # rubocop:enable Metrics/MethodLength
  end
end
