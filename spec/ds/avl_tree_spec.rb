# frozen_string_literal: true

require 'rspec'
require_relative '../../lib/ds/avl_tree'

# rubocop:disable Metrics/BlockLength
RSpec.describe Ds::AvlTree do
  let(:tree) { Ds::AvlTree.new }

  describe '#insert' do
    context 'when the tree is empty' do
      it 'inserts the node as root' do
        tree.insert(5)
        expect(tree.root.data).to eq(5)
      end
    end

    context 'when the tree is not empty' do
      it 'inserts the node in the correct position' do
        tree.insert(5)
        tree.insert(3)
        expect(tree.root.left.data).to eq(3)
      end
    end

    context 'when the tree is not empty' do
      it 'inserts the node in the correct position' do
        tree.insert(5)
        tree.insert(7)
        expect(tree.root.right.data).to eq(7)
      end
    end
  end

  describe '#traverse' do
    context 'when the tree is empty' do
      it 'displays nothing' do
        expect { tree.traverse }.to output("{}\n").to_stdout
      end
    end

    context 'when the tree is not empty' do
      it 'displays the tree' do
        tree.insert(5)
        tree.insert(3)
        tree.insert(7)
        expect { tree.traverse }.to output("{0=>[5], 1=>[3, 7]}\n").to_stdout
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
