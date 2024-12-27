# frozen_string_literal: true

require 'rspec'
require_relative '../../lib/algorithms/sort'

describe Algorithms::Sort do
  let(:array) { [3, 2, 1, 5, 4, 6, 8, 7, 9, 10] }

  describe '.bubble' do
    context 'when the array is not sorted' do
      it 'sorts the array' do
        Algorithms::Sort.bubble(array)
        expect(array).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
      end
    end
  end
end
