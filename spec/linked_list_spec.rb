# frozen_string_literal: true

require 'rspec'
require_relative '../lib/linked_list'

# rubocop:disable Metrics/BlockLength
RSpec.describe LinkedList do
  let(:list) { LinkedList.new }

  describe '#append' do
    it 'adds a node to the end of the list' do
      list.append(1)
      list.append(2)
      list.append(3)
      expect(list.head.value).to eq(1)
      expect(list.head.value).not_to eq(2)
      expect(list.tail.value).not_to eq(2)
      expect(list.tail.next).to eq(nil)
      expect(list.tail.prev).not_to eq(nil)
      expect(list.tail.value).to eq(3)
    end
  end

  describe '#insert' do
    it 'inserts a node at the specified index' do
      list.append(1)
      list.append(2)
      list.append(3)
      list.insert(4, 1)
      expect(list.head.value).to eq(1)
      expect(list.head.next).not_to eq(nil)
      expect(list.head.next.value).to eq(4)
      expect(list.head.next.next.value).to eq(2)
    end
  end

  describe '#remove' do
    it 'removes a node from the list' do
      list.append(1)
      list.append(2)
      list.append(3)
      list.remove(2)
      expect(list.head.value).to eq(1)
      expect(list.head.next.value).to eq(3)
    end
  end

  describe '#search' do
    it 'returns the index of a node in the list' do
      list.append(1)
      list.append(2)
      list.append(3)
      expect(list.search(2)).to eq(1)
    end

    it 'returns -1 if the node is not in the list' do
      list.append(1)
      list.append(2)
      list.append(3)
      expect(list.search(4)).to eq(-1)
    end
  end

  describe '#include?' do
    it 'returns true of a node in the list' do
      list.append(1)
      expect(list.include?(1)).to eq(true)
    end

    it 'returns false if a node is not in the list' do
      list.append(1)
      expect(list.include?(2)).to eq(false)
    end
  end

  describe '#clear' do
    it 'clears the linked list' do
      list.append(1)
      list.append(2)
      list.append(3)
      list.clear
      expect(list.head).to eq(nil)
      expect(list.tail).to eq(nil)
    end
  end
end
# rubocop:enable Metrics/BlockLength
