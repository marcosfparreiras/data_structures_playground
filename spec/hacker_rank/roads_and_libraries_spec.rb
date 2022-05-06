# frozen_string_literal: true

require 'hacker_rank/roads_and_libraries'

describe HackerRank::RoadsAndLibraries do
  subject { described_class.new(num_cities, c_lib, c_road, cities) }

  describe '#solve' do
    context 'example 1' do
      let(:num_cities) { 3 }
      let(:c_lib) { 2 }
      let(:c_road) { 1 }
      let(:cities) do
        [
          [1, 2],
          [3, 1],
          [2, 3]
        ]
      end
      let(:expected_minimum_cost) { 4 }

      it { expect(subject.find_minimum_cost).to eq(expected_minimum_cost) }
    end

    context 'example 2' do
      let(:num_cities) { 6 }
      let(:c_lib) { 2 }
      let(:c_road) { 5 }
      let(:cities) do
        [
          [1, 3],
          [3, 4],
          [2, 4],
          [1, 2],
          [2, 3],
          [5, 6]
        ]
      end
      let(:expected_minimum_cost) { 12 }

      it { expect(subject.find_minimum_cost).to eq(expected_minimum_cost) }
    end

    context 'example 3' do
      let(:num_cities) { 5 }
      let(:c_lib) { 6 }
      let(:c_road) { 1 }
      let(:cities) do
        [
          [1, 2],
          [1, 3],
          [1, 4]
        ]
      end
      let(:expected_minimum_cost) { 15 }

      it { expect(subject.find_minimum_cost).to eq(expected_minimum_cost) }
    end
  end
end
