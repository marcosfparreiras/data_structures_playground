# frozen_string_literal: true

require 'hacker_rank/connected_grid'

describe HackerRank::ConnectedGrid do
  subject { HackerRank::ConnectedGrid.new(grid) }

  describe '#max_connected_cell' do
    let(:result) { subject.max_connected_cell }

    context 'example 1' do
      let(:grid) do
        [
          [1, 1, 0, 0],
          [0, 1, 1, 0],
          [0, 0, 1, 0],
          [1, 0, 0, 0]
        ]
      end
      let(:expected_result) { 5 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 2' do
      let(:grid) do
        [
          [0, 0, 1, 1],
          [0, 0, 1, 0],
          [0, 1, 1, 0],
          [0, 1, 0, 0],
          [1, 1, 0, 0]
        ]
      end
      let(:expected_result) { 8 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 3' do
      let(:grid) do
        [
          [1, 0, 1, 1, 0],
          [1, 1, 0, 0, 1],
          [0, 1, 1, 1, 0],
          [0, 0, 0, 0, 1],
          [1, 1, 1, 0, 0]
        ]
      end
      let(:expected_result) { 10 }

      it { expect(result).to eq(expected_result) }
    end
  end
end
