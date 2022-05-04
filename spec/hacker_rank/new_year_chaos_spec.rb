# frozen_string_literal: true

require 'hacker_rank/new_year_chaos'

describe HackerRank::NewYearChaos do
  subject { described_class.new(final_positions) }

  describe '#mininum_bribes' do
    context 'when there is extra bribing' do
      let(:final_positions) { [2, 1, 6, 3, 4, 5, 7] }
      let(:expected_result) { 'Too chaotic' }

      it { expect(subject.mininum_bribes).to eq(expected_result) }
    end

    context 'when some one how is bribed, also bribes' do
      let(:final_positions) { [3, 2, 1, 4, 5] }
      let(:expected_result) { 3 }

      it { expect(subject.mininum_bribes).to eq(expected_result) }
    end

    context 'when no one who is bribed also bribes' do
      let(:final_positions) { [2, 1, 5, 3, 4] }
      let(:expected_result) { 3 }

      it { expect(subject.mininum_bribes).to eq(expected_result) }
    end
  end

  context 'hacker rank examples' do
    context 'example 1' do
      let(:final_positions) { [5, 1, 2, 3, 7, 8, 6, 4] }
      let(:expected_result) { 'Too chaotic' }

      it { expect(subject.mininum_bribes).to eq(expected_result) }
    end

    context 'example 2' do
      let(:final_positions) { [1, 2, 5, 3, 7, 8, 6, 4] }
      let(:expected_result) { 7 }

      it { expect(subject.mininum_bribes).to eq(expected_result) }
    end
  end
end
