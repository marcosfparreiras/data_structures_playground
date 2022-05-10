# frozen_string_literal: true

require 'leet_code/combination_sum3'

describe LeetCode::CombinationSum3 do
  subject { described_class.new(num_numbers, sum) }

  describe '#find_solution' do
    let(:result) { subject.find_solution }

    context 'example 1' do
      let(:num_numbers) { 3 }
      let(:sum) { 7 }
      let(:expected_result) { [[1, 2, 4]] }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 2' do
      let(:num_numbers) { 3 }
      let(:sum) { 9 }
      let(:expected_result) { [[1, 2, 6], [1, 3, 5], [2, 3, 4]] }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 2' do
      let(:num_numbers) { 4 }
      let(:sum) { 1 }
      let(:expected_result) { [] }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 3' do
      let(:num_numbers) { 9 }
      let(:sum) { 45 }
      let(:expected_result) { [[1, 2, 3, 4, 5, 6, 7, 8, 9]] }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 4' do
      let(:num_numbers) { 2 }
      let(:sum) { 33 }
      let(:expected_result) { [] }

      it { expect(result).to eq(expected_result) }
    end
  end
end
