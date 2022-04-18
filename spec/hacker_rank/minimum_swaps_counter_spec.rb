# frozen_string_literal: true

require 'hacker_rank/minimum_swaps_counter'

describe HackerRank::MinimumSwapsCounter do
  subject { HackerRank::MinimumSwapsCounter }

  describe '#count' do
    context 'when array is ordered' do
      let(:array) { [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }
      it 'returns 0' do
        expect(subject.new(array).count).to eq(0)
      end
    end

    context 'when array is not ordered' do
      context 'example 1' do
        let(:array) { [4, 3, 1, 2] }
        it 'returns correct value' do
          expect(subject.new(array).count).to eq(3)
        end
      end

      context 'example 2' do
        let(:array) { [2, 3, 4, 1, 5] }
        it 'returns correct value' do
          expect(subject.new(array).count).to eq(3)
        end
      end

      context 'example 3' do
        let(:array) { [1, 3, 5, 2, 4, 6, 7] }
        it 'returns correct value' do
          expect(subject.new(array).count).to eq(3)
        end
      end
    end
  end
end
