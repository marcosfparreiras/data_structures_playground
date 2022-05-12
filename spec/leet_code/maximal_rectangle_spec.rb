# frozen_string_literal: true

require 'leet_code/maximal_rectangle'

describe LeetCode::MaximalRectangle do
  subject { LeetCode::MaximalRectangle.new(matrix) }

  describe '#calculate' do
    let(:result) { subject.calculate }

    context 'example 1' do
      let(:matrix) do
        [
          %w[1 0 1 0 0],
          %w[1 0 1 1 1],
          %w[1 1 1 1 1],
          %w[1 0 0 1 0]
        ]
      end
      let(:expected_result) { 6 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 2' do
      let(:matrix) { [['0']] }
      let(:expected_result) { 0 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 3' do
      let(:matrix) { [['1']] }
      let(:expected_result) { 1 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 4' do
      let(:matrix) do
        [
          %w[0 1 1 1],
          %w[0 1 1 1],
          %w[0 1 1 1]
        ]
      end
      let(:expected_result) { 9 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 4' do
      let(:matrix) do
        [
          %w[0 1 1 1],
          %w[0 1 1 1],
          %w[1 1 1 0],
          %w[0 1 1 1],
          %w[0 1 1 1]
        ]
      end
      let(:expected_result) { 10 }

      it { expect(result).to eq(expected_result) }
    end
  end
end

describe LeetCode::LargestRectangleInHistogram do
  subject { LeetCode::LargestRectangleInHistogram.new(nums) }

  describe '#calculate' do
    let(:result) { subject.calculate }

    context 'example 1' do
      let(:nums) { [3, 1, 3, 2, 2] }
      let(:expected_result) { 6 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 1' do
      let(:nums) { [2, 1, 5, 6, 2, 3] }
      let(:expected_result) { 10 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 2' do
      let(:nums) { [2, 4] }
      let(:expected_result) { 4 }

      it { expect(result).to eq(expected_result) }
    end
  end
end
