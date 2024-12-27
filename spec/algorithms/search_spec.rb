# frozen_string_literal: true

require 'rspec'
require_relative '../../lib/algorithms/search'

describe Algorithms::Search do
  let(:array) { [1, 2, 3, 4, 5, 6] }

  describe '.linear' do
    context 'when the element is in the array' do
      it 'returns the index of the element' do
        expect(Algorithms::Search.linear(array, 3)).to eq(2)
      end
    end

    context 'when the element is not in the array' do
      it 'returns -1' do
        expect(Algorithms::Search.linear(array, 10)).to eq(-1)
      end
    end
  end
end
