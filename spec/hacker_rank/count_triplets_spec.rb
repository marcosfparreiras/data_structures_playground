# frozen_string_literal: true

require 'hacker_rank/count_triplets'

describe HackerRank::CountTriplets do
  subject { HackerRank::CountTriplets.new(list, ratio) }

  describe '#count' do
    context 'when elements are part of the geometric progression' do
      context 'example 1' do
        let(:list) { [1, 2, 2, 4] }
        let(:ratio) { 2 }
        let(:expected_value) { 2 }

        it { expect(subject.count).to eq(expected_value) }
      end

      context 'example 2' do
        let(:list) { [1, 3, 9, 9, 27, 81] }
        let(:ratio) { 3 }
        let(:expected_value) { 6 }

        it { expect(subject.count).to eq(expected_value) }
      end

      context 'example 3' do
        let(:list) { [1, 5, 5, 25, 125] }
        let(:ratio) { 5 }
        let(:expected_value) { 4 }

        it { expect(subject.count).to eq(expected_value) }
      end

      context 'example 4' do
        let(:list) { [1, 3, 3, 9, 9, 81] }
        let(:ratio) { 3 }
        let(:expected_value) { 4 }

        it { expect(subject.count).to eq(expected_value) }
      end

      context 'and elements appear in wrong order' do
        let(:list) { [5, 1, 5, 25, 125] }
        let(:ratio) { 5 }
        let(:expected_value) { 2 }

        it { expect(subject.count).to eq(expected_value) }
      end
    end

    context 'when not all elements are part of the same geometric progression' do
      let(:list) { [1, 2, 5, 5, 10, 25, 50, 125] }
        let(:ratio) { 5 }
        let(:expected_value) { 5 }

        it { expect(subject.count).to eq(expected_value) }
    end
  end
end
