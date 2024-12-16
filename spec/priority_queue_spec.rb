# frozen_string_literal: true

require 'rspec'
require_relative '../lib/priority_queue'

# rubocop:disable Metrics/BlockLength
RSpec.describe PriorityQueue do
  let(:priority_queue) { PriorityQueue.new }

  describe '#push' do
    it 'adds an element to the priority queue' do
      priority_queue.push(1)
      expect(priority_queue.size).to eq(1)
    end
  end

  describe '#pop' do
    it 'removes an element from the priority queue' do
      priority_queue.push(1)
      priority_queue.push(2)
      priority_queue.pop
      expect(priority_queue.size).to eq(1)
    end

    it 'returns nil if the priority queue is empty' do
      expect(priority_queue.pop).to eq(nil)
    end
  end

  describe '#peek' do
    it 'returns the minimum element in the priority queue' do
      priority_queue.push(1)
      priority_queue.push(2)
      expect(priority_queue.peek).to eq(1)
    end
  end

  describe '#size' do
    it 'returns the number of elements in the priority queue' do
      priority_queue.push(1)
      priority_queue.push(2)
      expect(priority_queue.size).to eq(2)
    end
  end

  describe '#empty?' do
    it 'returns true if the priority queue is empty' do
      expect(priority_queue.empty?).to eq(true)
    end

    it 'returns false if the priority queue is not empty' do
      priority_queue.push(1)
      expect(priority_queue.empty?).to eq(false)
    end
  end

  describe '#search' do
    it 'returns the index of an element in the priority queue' do
      priority_queue.push(1)
      priority_queue.push(2)
      expect(priority_queue.search(2)).to eq(1)
    end

    it 'returns -1 if the element is not in the priority queue' do
      priority_queue.push(1)
      priority_queue.push(2)
      expect(priority_queue.search(3)).to eq(-1)
    end
  end

  describe '#clear' do
    it 'clears all elements from the priority queue' do
      priority_queue.push(1)
      priority_queue.push(2)
      priority_queue.clear
      expect(priority_queue.size).to eq(0)
    end
  end
end
# rubocop:enable Metrics/BlockLength
