# frozen_string_literal: true

require 'hacker_rank/frequency_queries'

describe HackerRank::FrequencyQueries do
  subject { described_class.new(queries) }

  describe '#run' do
    context 'example 1' do
      let(:queries) do
        [
          [2, 5],
          [3, 5],
          [1, 1],
          [1, 1],
          [2, 1],
          [3, 2],
          [3, 1],
          [1, 1],
          [3, 2],
          [1, 4]
        ]
      end

      let(:expected_result) { [0, 0, 1, 1] }

      it { expect(subject.run).to eq(expected_result) }
    end

    context 'example 2' do
      let(:queries) do
        [
          [1, 5],
          [1, 6],
          [3, 2],
          [1, 10],
          [1, 10],
          [1, 6],
          [2, 5],
          [3, 2]
        ]
      end

      let(:expected_result) { [0, 1] }

      it { expect(subject.run).to eq(expected_result) }
    end

    context 'example 3' do
      let(:queries) do
        [
          [1, 3],
          [2, 3],
          [3, 2],
          [1, 4],
          [1, 5],
          [1, 5],
          [1, 4],
          [3, 2],
          [2, 4],
          [3, 2]
        ]
      end

      let(:expected_result) { [0, 1, 1] }

      it { expect(subject.run).to eq(expected_result) }
    end
  end
end
