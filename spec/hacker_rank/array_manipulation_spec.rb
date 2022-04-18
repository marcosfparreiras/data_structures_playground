# frozen_string_literal:true

require 'hacker_rank/array_manipulation'

describe HackerRank::ArrayManipulation do
  # subject { HackerRank::ArrayManipulation.new(n, queries) }
  subject { HackerRank::ArrayManipulation.new(n, queries) }

  describe '#process' do
    context 'example 1' do
      let(:n) { 10 }
      let(:queries) do
        [
          [1, 5, 3],
          [4, 8, 7],
          [6, 9, 1]
        ]
      end
      let(:expected_result) { 10 }

      it 'returns right value' do
        expect(subject.process).to eq(expected_result)
      end
    end

    context 'example 2' do
      let(:n) { 5 }
      let(:queries) do
        [
          [1, 2, 100],
          [2, 5, 100],
          [3, 4, 100]
        ]
      end
      let(:expected_result) { 200 }

      it 'returns right value' do
        expect(subject.process).to eq(expected_result)
      end
    end

    context 'example 3' do
      let(:n) { 10 }
      let(:queries) do
        [
          [2, 6, 8],
          [3, 5, 7],
          [1, 8, 1],
          [5, 9, 15]
        ]
      end
      let(:expected_result) { 31 }

      it 'returns right value' do
        expect(subject.process).to eq(expected_result)
      end
    end
  end
end
