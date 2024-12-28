# frozen_string_literal: true

require 'rspec'
require_relative '../../lib/algorithms/sort'

# rubocop:disable Metrics/BlockLength
describe Algorithms::Sort do
  let(:array) do
    [195, 129, 992, 164, 652, 523, 385, 416, 408, 602, 264, 405, 597, 24, 458, 202, 714, 192, 279, 534, 575, 641, 887,
     746, 108, 479, 199, 65, 986, 71, 247, 960, 650, 423, 581, 164, 302, 389, 183, 938, 217, 361, 34, 972, 8, 502, 152,
     788, 605, 84, 563, 400, 123, 888, 31, 461, 497, 122, 501, 182, 470, 146, 842, 595, 604, 525, 308, 211, 51, 817,
     192, 861, 928, 694, 662, 978, 6, 592, 655, 945, 544, 162, 908, 68, 64, 592, 545, 693, 931, 916, 176, 154, 28, 458,
     366, 916, 515, 956, 299, 42, 491, 658, 64, 768, 406, 190, 772, 54, 302, 713, 402, 603, 587, 529, 940, 335, 720, 765,
     778, 322, 510, 757, 268, 202, 21, 396, 264, 901, 810, 520, 794, 535, 574, 921, 43, 532, 535, 425, 379, 716, 261, 42,
     357, 725, 911, 477, 157, 239, 651, 56, 218, 307, 576, 707, 240, 961, 883, 662, 647, 327, 62, 968, 159, 495, 186, 281,
     283, 880, 930, 233, 76, 503, 354, 993, 48, 237, 732, 108, 872, 875, 33, 166, 927, 707, 568, 412, 505, 731, 121, 961, 70,
     463, 760, 904, 523, 327, 817, 747, 411, 173]
  end
  let(:sorted) do
    [6, 8, 21, 24, 28, 31, 33, 34, 42, 42, 43, 48, 51, 54, 56, 62, 64, 64, 65, 68, 70, 71, 76, 84, 108, 108, 121, 122,
     123, 129, 146, 152, 154, 157, 159, 162, 164, 164, 166, 173, 176, 182, 183, 186, 190, 192, 192, 195, 199, 202, 202,
     211, 217, 218, 233, 237, 239, 240, 247, 261, 264, 264, 268, 279, 281, 283, 299, 302, 302, 307, 308, 322, 327, 327,
     335, 354, 357, 361, 366, 379, 385, 389, 396, 400, 402, 405, 406, 408, 411, 412, 416, 423, 425, 458, 458, 461, 463,
     470, 477, 479, 491, 495, 497, 501, 502, 503, 505, 510, 515, 520, 523, 523, 525, 529, 532, 534, 535, 535, 544, 545,
     563, 568, 574, 575, 576, 581, 587, 592, 592, 595, 597, 602, 603, 604, 605, 641, 647, 650, 651, 652, 655, 658, 662,
     662, 693, 694, 707, 707, 713, 714, 716, 720, 725, 731, 732, 746, 747, 757, 760, 765, 768, 772, 778, 788, 794, 810,
     817, 817, 842, 861, 872, 875, 880, 883, 887, 888, 901, 904, 908, 911, 916, 916, 921, 927, 928, 930, 931, 938, 940,
     945, 956, 960, 961, 961, 968, 972, 978, 986, 992, 993]
  end

  describe '.bubble' do
    context 'when the array is not sorted' do
      it 'sorts the array using bubble' do
        start = Time.now
        wow = array.dup
        Algorithms::Sort.bubble(wow)
        expect(wow).to eq(sorted)
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
        expect(wow).to eq(sorted)
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
        expect(wow).to eq(sorted)
        close = Time.now
        puts "Insertion took: #{close - start} seconds"
      end
    end
  end

  describe '.merge' do
    context 'when the array is not sorted' do
      it 'sorts the array using merge algorithm' do
        start = Time.now
        wow = array.dup
        Algorithms::Sort.merge(wow)
        expect(wow).to eq(sorted)
        close = Time.now
        puts "Merge took: #{close - start} seconds"
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
