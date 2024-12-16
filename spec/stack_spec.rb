# frozen_string_literal: true

require 'rspec'
require_relative '../lib/stack'

# rubocop:disable Metrics/BlockLength
RSpec.describe Stack do
  let(:stack) { Stack.new }

  describe '#push' do
    it 'adds an element to the stack' do
      stack.push(1)
      expect(stack.size).to eq(1)
    end
  end

  describe '#pop' do
    it 'removes an element from the stack' do
      stack.push(1)
      stack.pop
      expect(stack.size).to eq(0)
    end

    it 'raises an error if the stack is empty' do
       expect { stack.pop }.to raise_error('Stack is empty')
    end
  end

  describe '#peek' do
    it 'returns the last element in the stack' do
       stack.push(1)
       stack.push(2)
       expect(stack.peek).to eq(2)
    end
  end

  describe '#size' do
    it 'returns the size of the stack' do
       stack.push(1)
       stack.push(2)
       expect(stack.size).to eq(2)
    end
  end

  describe '#search' do
    it 'returns the index of an element in the stack' do
       stack.push(1)
       stack.push(2)
       expect(stack.search(2)).to eq(1)
    end

    it 'returns -1 if the element is not in the stack' do
       stack.push(1)
       stack.push(2)
       expect(stack.search(3)).to eq(-1)
    end
  end

  describe '#clear' do
    it 'removes all elements from the stack' do
       stack.push(1)
       stack.push(2)
       stack.clear
       expect(stack.size).to eq(0)
    end
  end

  describe '#empty?' do
    it 'returns true if the stack is empty' do
      expect(stack.empty?).to be true
    end

    it 'returns false if the stack is not empty' do
      stack.push(1)
      expect(stack.empty?).to be false
    end
  end
end
# rubocop:enable Metrics/BlockLength
