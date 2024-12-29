# frozen_string_literal: true

require_relative './node'

module Ds
  # This class is an implementation of an AVL Tree
  class AvlTree
    attr_accessor :root

    def initialize
      @root = nil
    end

    def insert(data)
      @root = insert_helper(@root, Node.new(data))
    end

    def traverse
      map = {}
      traverse_helper(@root, map)
      puts map
    end

    private

    def height(node)
      node ? node.height : 0
    end

    def balance_factor(node)
      node ? height(node.left) - height(node.right) : 0
    end

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def right_rotate(y)
      x = y.left
      t2 = x.right

      x.right = y
      y.left = t2

      y.height = [height(y.left), height(y.right)].max + 1
      x.height = [height(x.left), height(x.right)].max + 1

      x
    end

    def left_rotate(x)
      y = x.right
      t2 = y.left

      y.left = x
      x.right = t2

      x.height = [height(x.left), height(x.right)].max + 1
      y.height = [height(y.left), height(y.right)].max + 1

      y
    end

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    def insert_helper(node, new_node)
      return new_node unless node

      if new_node.data < node.data
        node.left = insert_helper(node.left, new_node)
      else
        node.right = insert_helper(node.right, new_node)
      end

      node.height = [height(node.left), height(node.right)].max + 1

      balance = balance_factor(node)

      return right_rotate(node) if balance > 1 && new_node.data < node.left.data

      return left_rotate(node) if balance < -1 && new_node.data > node.right.data

      if balance > 1 && new_node.data > node.left.data
        node.left = left_rotate(node.left)
        return right_rotate(node)
      end

      if balance < -1 && new_node.data < node.right.data
        node.right = right_rotate(node.right)
        return left_rotate(node)
      end

      node
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

    def traverse_helper(root, map, depth = 0)
      return unless root

      map[depth] ||= []
      map[depth] << root.data
      traverse_helper(root.left, map, depth + 1)
      traverse_helper(root.right, map, depth + 1)
    end
  end
end
