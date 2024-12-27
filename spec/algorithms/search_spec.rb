# frozen_string_literal: true

require 'rspec'
require_relative '../../lib/algorithms/search'

describe Algorithms::Search do
  let(:array) { [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11] }

  describe '.linear' do
    context 'when the element is in the array' do
      it 'returns the index of the element' do
        expect(Algorithms::Search.linear(array, 3)).to eq(2)
      end
    end

    context 'when the element is not in the array' do
      it 'returns -1' do
        expect(Algorithms::Search.linear(array, 14)).to eq(-1)
      end
    end
  end

  describe '.binary' do
    context 'when the element is in the array' do
      it 'returns the index of the element' do
        expect(Algorithms::Search.binary(array, 3)).to eq(2)
      end
    end

    context 'when the element is not in the array' do
      it 'returns -1' do
        expect(Algorithms::Search.binary(array, 14)).to eq(-1)
      end
    end
  end

  describe '.interpolation' do
    context 'when the element is in the array' do
      it 'return the index of the element' do
        expect(Algorithms::Search.interpolation(array, 8)).to eq(7)
      end
    end

    context 'when the element is not in the array' do
      it 'return -1' do
        expect(Algorithms::Search.interpolation(array, 14)).to eq(-1)
      end
    end
  end
end
