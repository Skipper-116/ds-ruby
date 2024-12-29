# frozen_string_literal: true

require_relative './node'

module Ds
  # This class is an implementation of a Binary Search Tree
  class BinarySearchTree
    attr_accessor :root

    def initialize
      @root = nil
    end

    def insert(node)
      @root = insert_helper(@root, node)
    end

    def display
      display_helper(@root)
    end

    def search(data)
      search_helper(@root, data)
    end

    def remove(data)
      unless @root
        puts 'Tree is empty'
        return
      end

      if search(data)
        remove_helper(@root, data)
      else
        puts 'Data not found'
      end
    end

    def traverse
      map = {}
      traverse_helper(@root, map)
      puts map
    end

    private

    # rubocop:disable Metrics/MethodLength
    def insert_helper(root, node)
      unless root
        root = node
        return root
      end

      data = node.data
      if data < root.data
        root.left = insert_helper(root.left, node)
      else
        root.right = insert_helper(root.right, node)
      end
      root
    end

    def display_helper(root)
      return unless root

      display_helper(root.left)
      puts root.data
      display_helper(root.right)
    end

    def search_helper(root, data)
      return false unless root

      if root.data > data
        search_helper(root.left, data)
      elsif root.data < data
        search_helper(root.right, data)
      elsif root.data == data
        true
      end
    end

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    def remove_helper(root, data)
      return root unless root

      if root.data > data
        root.left = remove_helper(root.left, data)
      elsif root.data < data
        root.right = remove_helper(root.right, data)
      else
        unless root.left || root.right
          root = nil
          return
        end

        if root.right
          root.data = successor(root)
          root.right = remove_helper(root.right, root.data)
        end
        if root.left
          root.data = predecessor(root)
          root.left = remove_helper(root.left, root.data)
        end
        # to be implement
      end
      root
    end

    def successor(root)
      root = root.right
      root = root.left until root&.left&.empty? if root&.left
      root.data
    end

    def predecessor(root)
      root = root.left
      root = root.right until root&.right&.empty? if root&.right
      root.data
    end

    def traverse_helper(root, map, depth = 0)
      return unless root

      map[depth] ||= []
      map[depth] << root.data
      traverse_helper(root.left, map, depth + 1)
      traverse_helper(root.right, map, depth + 1)
    end
    # rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  end
end
