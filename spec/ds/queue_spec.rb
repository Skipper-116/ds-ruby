# frozen_string_literal: true

require 'rspec'
require_relative '../../lib/ds/queue'

# rubocop:disable Metrics/BlockLength
RSpec.describe Ds::Queue do
  let(:queue) { Ds::Queue.new }

  describe '#enqueue' do
    it 'adds an element to the queue' do
      queue.enqueue(1)
      expect(queue.size).to eq(1)
    end
  end

  describe '#dequeue' do
    it 'removes an element from the queue' do
      queue.enqueue(1)
      queue.enqueue(2)
      queue.dequeue
      expect(queue.size).to eq(1)
      expect(queue.peek).to eq(2)
    end

    it 'raises an error if the queue is empty' do
      expect { queue.dequeue }.to raise_error('Queue is empty')
    end
  end

  describe '#peek' do
    it 'returns the first element in the queue' do
       queue.enqueue(1)
       queue.enqueue(2)
       expect(queue.peek).to eq(1)
    end

    it 'raises an error if the queue is empty' do
      expect { queue.peek }.to raise_error('Queue is empty')
    end
  end

  describe '#size' do
    it 'returns the size of the queue' do
       queue.enqueue(1)
       queue.enqueue(2)
       expect(queue.size).to eq(2)
    end
  end

  describe '#search' do
    it 'returns the index of an element in the queue' do
       queue.enqueue(1)
       queue.enqueue(2)
       expect(queue.search(2)).to eq(1)
    end

    it 'returns -1 if the element is not in the queue' do
       queue.enqueue(1)
       queue.enqueue(2)
       expect(queue.search(3)).to eq(-1)
    end
  end

  describe '#include?' do
    it 'return true or false if the queue contains an element' do
      queue.enqueue(1)
      queue.enqueue(2)
      expect(queue.include?(2)).to eq(true)
      expect(queue.include?(3)).to eq(false)
    end
  end

  describe '#clear' do
    it 'clears all elements from the queue' do
       queue.enqueue(1)
       queue.enqueue(2)
       queue.clear
       expect(queue.size).to eq(0)
    end
  end

  describe '#empty?' do
    it 'returns true if the queue is empty' do
       expect(queue.empty?).to eq(true)
    end

    it 'returns false if the queue is not empty' do
       queue.enqueue(1)
       expect(queue.empty?).to eq(false)
    end
  end
end
# rubocop:enable Metrics/BlockLength
