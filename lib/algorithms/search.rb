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

    # rubocop:disable Metrics/AbcSize
    def self.interpolation(array, value)
      low = 0
      high = array.size - 1

      while value >= array[low] && value <= array[high] && low <= high
        probe = low + (high - low) * (value - array[low]) / (array[high] - array[low])

        return probe if array[probe] == value

        if array[probe] < value
          low = probe + 1
        else
          high = probe - 1
        end
      end
      -1
    end

    def self.depth_first(graph, src)
      visited = Array.new(graph.storage.size, false)
      depth_first_matrix(src, visited, graph.storage) if graph.type == :matrix
      depth_first_list(src, visited, graph.storage) if graph.type == :list
    end

    def self.depth_first_matrix(src, visited, graph)
      return if visited[src]

      visited[src] = true
      puts "#{src} = visited"
      graph[src].each_with_index do |edge, i|
        depth_first_matrix(i, visited, graph) if edge == 1 && !visited[i]
      end
    end

    def self.depth_first_list(src, visited, graph)
      return if visited[src]

      visited[src] = true
      puts "#{src} = visited"
      graph[src].each do |edge|
        depth_first_list(edge, visited, graph) unless visited[edge]
      end
    end
    # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
  end
end
