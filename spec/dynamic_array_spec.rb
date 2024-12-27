# frozen_string_literal: true

require 'rspec'
require_relative '../lib/dynamic_array'

# rubocop:disable Metrics/BlockLength
RSpec.describe DynamicArray do
  let(:da) { DynamicArray.new }

  describe '#add' do
    it 'adds an element to the array' do
      da.add(1)
      da.add(2)
      da.add(3)
      expect(da.array).to eq([1, 2, 3, nil, nil, nil, nil, nil, nil, nil])
    end
  end

  describe '#insert' do
    it 'inserts an element at the specified index' do
      da.add(1)
      da.add(2)
      da.add(3)
      da.insert(1, 4)
      expect(da.to_s).to eq([1, 4, 2, 3, nil, nil, nil, nil, nil, nil])
    end
  end

  describe '#delete' do
    it 'deletes an element from the array' do
      da.add(1)
      da.add(2)
      da.add(3)
      da.delete(2)
      expect(da.to_s).to eq([1, 3, nil, nil, nil, nil, nil, nil, nil, nil])
    end
  end

  describe '#search' do
    it 'returns the index of an element in the array' do
      da.add(1)
      da.add(2)
      da.add(3)
      expect(da.search(2)).to eq(1)
    end
  end
end
# rubocop:enable Metrics/BlockLength
