# frozen_string_literal: true

require 'leet_code/count_sorted_vowel_strings'

describe LeetCode::CountSortedVowelStrings do
  subject { described_class.new(num) }

  describe '#count' do
    let(:result) { subject.count }

    context 'example 1' do
      let(:num) { 1 }
      let(:expected_result) { 5 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 2' do
      let(:num) { 2 }
      let(:expected_result) { 15 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 3' do
      let(:num) { 4 }
      let(:expected_result) { 70 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 4' do
      let(:num) { 12 }
      let(:expected_result) { 1820 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 5' do
      let(:num) { 0 }
      let(:expected_result) { 0 }

      it { expect(result).to eq(expected_result) }
    end
  end
end
