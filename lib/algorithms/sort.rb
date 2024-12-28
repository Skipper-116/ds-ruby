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

    def self.insertion(array)
      n = array.size - 1
      (1..n).each do |i|
        j = i - 1
        key = array[i]
        min = i

        j.downto(0) do |k|
          if key < array[k]
            array[k], array[min] = array[min], array[k]
            min = k
          end
        end
      end
    end

    def self.merge(array)
      n = array.size
      return if n <= 1

      left = array.take(n / 2)
      right = array.drop(n / 2)
      merge(left)
      merge(right)
      merger(left, right, array)
    end

    # rubocop:disable Metrics/AbcSize
    def self.merger(left, right, array)
      left_size = array.size / 2
      right_size = array.size - left_size
      i = 0
      l = 0
      r = 0

      while l < left_size && r < right_size
        if left[l] < right[r]
          array[i] = left[l]
          i += 1
          l += 1
        else
          array[i] = right[r]
          i += 1
          r += 1
        end
      end

      while l < left_size
        array[i] = left[l]
        i += 1
        l += 1
      end

      while r < right_size
        array[i] = right[r]
        i += 1
        r += 1
      end
    end

    def self.quick(array, start, close)
      return if close <= start

      pivot = partition(array, start, close)
      quick(array, start, pivot - 1)
      quick(array, pivot + 1, close)
    end

    def self.partition(array, start, close)
      pivot = array[close]
      i = start - 1

      (start...close).each do |j|
        if array[j] < pivot
          i += 1
          array[i], array[j] = array[j], array[i]
        end
      end

      i += 1
      # Place the pivot in its correct position
      array[i], array[close] = array[close], array[i]
      i
    end
    # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
  end
end
