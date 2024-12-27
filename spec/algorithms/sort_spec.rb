# frozen_string_literal: true

require 'rspec'
require_relative '../../lib/algorithms/sort'

# rubocop:disable Metrics/BlockLength
describe Algorithms::Sort do
  let(:array) { [3, 2, 1, 5, 4, 6, 8, 7, 9, 10] }

  describe '.bubble' do
    context 'when the array is not sorted' do
      it 'sorts the array using bubble' do
        start = Time.now
        wow = array.dup
        Algorithms::Sort.bubble(wow)
        expect(wow).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        close = Time.now
        puts "Bubble took: #{close - start} seconds"
      end
    end
  end

  describe '.selection' do
    context 'when the array is not sorted' do
      it 'sorts the array using selection algorithm' do
        start = Time.now
        wow = array.dup
        Algorithms::Sort.selection(wow)
        expect(wow).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        close = Time.now
        puts "Selection took: #{close - start} seconds"
      end
    end
  end

  describe '.insertion' do
    context 'when the array is not sorted' do
      it 'sorts the array using insertion algorithm' do
        start = Time.now
        wow = array.dup
        Algorithms::Sort.insertion(wow)
        expect(wow).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        close = Time.now
        puts "Insertion took: #{close - start} seconds"
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
