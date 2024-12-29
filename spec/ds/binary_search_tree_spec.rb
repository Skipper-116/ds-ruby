# frozen_string_literal: true

require 'rspec'
require_relative '../../lib/ds/binary_search_tree'

# rubocop:disable Metrics/BlockLength
RSpec.describe Ds::BinarySearchTree do
  let(:tree) { Ds::BinarySearchTree.new }

  describe '#insert' do
    context 'when the tree is empty' do
      it 'inserts the node as root' do
        node = Ds::Node.new(5)
        tree.insert(node)
        expect(tree.root.data).to eq(5)
      end
    end

    context 'when the tree is not empty' do
      it 'inserts the node in the correct position' do
        node1 = Ds::Node.new(5)
        node2 = Ds::Node.new(3)
        tree.insert(node1)
        tree.insert(node2)
        expect(tree.root.left.data).to eq(3)
      end
    end
  end

  describe '#display' do
    context 'when the tree is empty' do
      it 'displays nothing' do
        expect { tree.display }.to output('').to_stdout
      end
    end

    context 'when the tree is not empty' do
      it 'displays the tree' do
        node1 = Ds::Node.new(5)
        node2 = Ds::Node.new(3)
        node3 = Ds::Node.new(7)
        tree.insert(node1)
        tree.insert(node2)
        tree.insert(node3)
        expect { tree.display }.to output("3\n5\n7\n").to_stdout
      end
    end
  end

  describe '#search' do
    context 'when the tree is empty' do
      it 'returns false' do
        expect(tree.search(5)).to eq(false)
      end
    end

    context 'when the tree is not empty' do
      it 'returns true if the data is found' do
        node1 = Ds::Node.new(5)
        node2 = Ds::Node.new(3)
        tree.insert(node1)
        tree.insert(node2)
        expect(tree.search(3)).to eq(true)
      end

      it 'returns false if the data is not found' do
        node1 = Ds::Node.new(5)
        node2 = Ds::Node.new(3)
        tree.insert(node1)
        tree.insert(node2)
        expect(tree.search(7)).to eq(false)
      end
    end
  end

  describe '#remove' do
    context 'when the tree is empty' do
      it 'prints that the tree is empty' do
        expect { tree.remove(5) }.to output("Tree is empty\n").to_stdout
      end
    end

    context 'when the tree is not empty' do
      it 'prints that the data is not found' do
        node1 = Ds::Node.new(5)
        tree.insert(node1)
        expect { tree.remove(3) }.to output("Data not found\n").to_stdout
      end

      it 'removes the node from the tree' do
        node1 = Ds::Node.new(5)
        node2 = Ds::Node.new(3)
        tree.insert(node1)
        tree.insert(node2)
        tree.remove(3)
        expect(tree.search(3)).to eq(false)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
