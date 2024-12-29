# frozen_string_literal: true

require 'rspec'
require_relative '../../lib/ds/graph'

# rubocop:disable Metrics/BlockLength
RSpec.describe Ds::Graph do
  describe '#initialize' do
    context 'when the type is not valid' do
      it 'raises an error' do
        expect { Ds::Graph.new(type: :wow) }.to raise_error(ArgumentError)
      end
    end

    context 'when the directed is not valid' do
      it 'raises an error' do
        expect { Ds::Graph.new(type: :matrix, directed: 'wow') }.to raise_error(ArgumentError)
      end
    end

    context 'when the type is valid' do
      it 'initializes the graph' do
        graph = Ds::Graph.new(type: :matrix)
        expect(graph.type).to eq(:matrix)
      end
    end

    context 'when the directed is valid' do
      it 'initializes the graph' do
        graph = Ds::Graph.new(type: :matrix, directed: false)
        expect(graph.directed).to eq(false)
      end
    end
  end

  describe '#add_edge' do
    context 'when the graph is a list' do
      it 'adds an edge to the graph' do
        graph = Ds::Graph.new(type: :list)
        graph.add_edge(1, 2)
        expect(graph.storage[1]).to eq([2])
      end
    end

    context 'when the graph is a matrix' do
      it 'adds an edge to the graph' do
        graph = Ds::Graph.new(type: :matrix)
        graph.add_edge(1, 2)
        expect(graph.storage[1][2]).to eq(1)
      end
    end
  end

  describe '#remove_edge' do
    context 'when the graph is a list' do
      it 'removes an edge from the graph' do
        graph = Ds::Graph.new(type: :list)
        graph.add_edge(1, 2)
        graph.remove_edge(1, 2)
        expect(graph.storage[1]).to eq([])
      end
    end

    context 'when the graph is a matrix' do
      it 'removes an edge from the graph' do
        graph = Ds::Graph.new(type: :matrix)
        graph.add_edge(1, 2)
        graph.remove_edge(1, 2)
        expect(graph.storage[1][2]).to eq(0)
      end
    end
  end

  describe '#display' do
    context 'when the graph is a list' do
      it 'displays the graph' do
        graph = Ds::Graph.new(type: :list, directed: false)
        graph.add_edge(1, 2)
        expect { graph.display }.to output("1 -> 2\n2 -> 1\n").to_stdout
      end
    end

    context 'when the graph is a matrix' do
      it 'displays the graph' do
        graph = Ds::Graph.new(type: :matrix, directed: true)
        graph.add_edge(1, 2)
        # this will ouput the complete matrix which is a 10x10 matrix
        # we need to improve our test
        expect do
          graph.display
        end.to output("0 0 0 0 0 0 0 0 0 0\n0 0 1 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n0 0 0 0 0 0 0 0 0 0\n").to_stdout
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
