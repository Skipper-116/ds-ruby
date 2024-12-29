# frozen_string_literal: true

module Ds
  # This is an implementation of a graph
  class Graph
    VALID_TYPES = %i[matrix list].freeze
    VALID_DIRECTS = [true, false].freeze

    attr_accessor :directed, :size, :storage, :type

    # This graph can implement both adjaceny matrix and list
    #
    # @param type [Symbol]. The type of the graph acceptable are :matrix and :list
    # @param directed [Boolean]. whether the graph is directed or not
    # @param size [Integer]. Used for matrix graph
    def initialize(type:, directed: true, size: 10)
      raise ArgumentError, "Value for type must be one of: #{VALID_TYPES.join(', ')}" unless VALID_TYPES.include?(type)
      unless VALID_DIRECTS.include?(directed)
        raise ArgumentError, "Value for directed must be one of: #{VALID_DIRECTS.join(', ')}"
      end

      @type = type
      @directed = directed
      @size = size
      @storage = type == :matrix ? Array.new(size) { Array.new(size, 0) } : {}
    end

    # rubocop:disable Metrics/AbcSize
    def add_edge(vertex_one, vertex_two)
      if type == :list
        add_vertex vertex_one
        add_vertex vertex_two
        storage[vertex_one] << vertex_two
        storage[vertex_two] << vertex_one unless directed
      else
        storage[vertex_one][vertex_two] = 1
        storage[vertex_two][vertex_one] = 1 unless directed
      end
    end
    # rubocop:enable Metrics/AbcSize

    def remove_edge(vertex_one, vertex_two)
      if type == :list
        storage[vertex_one].delete vertex_two
        storage[vertex_two].delete vertex_one unless directed
      else
        storage[vertex_one][vertex_two] = 0
        storage[vertex_two][vertex_one] = 0 unless directed
      end
    end

    def display
      if type == :list
        storage.each do |vertex, edges|
          puts "#{vertex} -> #{edges.join(', ')}"
        end
      else
        storage.each do |row|
          puts row.join(' ')
        end
      end
    end

    def check_edge(vertex_one, vertex_two)
      if type == :list
        storage[vertex_one].include?(vertex_two) || storage[vertex_two].include?(vertex_one)
      else
        storage[vertex_one][vertex_two] == 1 || storage[vertex_two][vertex_one] == 1
      end
    rescue StandardError
      false
    end

    private

    def add_vertex(vertex)
      storage[vertex] ||= []
    end
  end
end
