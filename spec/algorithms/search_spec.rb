# frozen_string_literal: true

require 'rspec'
require_relative '../../lib/algorithms/search'
require_relative '../../lib/ds/graph'

# rubocop:disable Metrics/BlockLength
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

  describe '.depth_first' do
    context 'when the graph is not empty' do
      it 'returns the depth first search of matrix graph' do
        graph = Ds::Graph.new(type: :matrix, directed: false)
        graph.add_edge(0, 1)
        graph.add_edge(0, 2)
        graph.add_edge(1, 2)
        graph.add_edge(2, 0)
        graph.add_edge(2, 3)
        graph.add_edge(3, 3)
        expect do
          Algorithms::Search.depth_first(graph, 2)
        end.to output("2 = visited\n0 = visited\n1 = visited\n3 = visited\n").to_stdout
      end

      it 'returns the depth first search of list graph' do
        graph = Ds::Graph.new(type: :list, directed: false)
        graph.add_edge(0, 1)
        graph.add_edge(0, 2)
        graph.add_edge(1, 2)
        graph.add_edge(2, 0)
        graph.add_edge(2, 3)
        graph.add_edge(3, 3)
        expect do
          Algorithms::Search.depth_first(graph, 2)
        end.to output("2 = visited\n0 = visited\n1 = visited\n3 = visited\n").to_stdout
      end
    end

    context 'when the graph is empty' do
      it 'returns nil' do
        graph = Ds::Graph.new(type: :matrix, directed: false)
        expect(Algorithms::Search.depth_first(graph, 2)).to eq(nil)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
