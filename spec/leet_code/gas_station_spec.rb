# frozen_string_literal: true

require 'leet_code/gas_station'

describe LeetCode::GasStation do
  subject { described_class.new(gas, cost) }

  describe '#find_smallest_index' do
    let(:result) { subject.find_smallest_index }

    context 'example 1' do
      let(:gas) { [1, 2, 3, 4, 5] }
      let(:cost) { [3, 4, 5, 1, 2] }
      let(:expected_result) { 3 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 2' do
      let(:gas) { [2, 3, 4] }
      let(:cost) { [3, 4, 3] }
      let(:expected_result) { -1 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 3' do
      let(:gas) { [3, 1, 1] }
      let(:cost) { [1, 2, 2] }
      let(:expected_result) { 0 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 4' do
      let(:gas) { [0, 0, 0] }
      let(:cost) { [0, 0, 0] }
      let(:expected_result) { -1 }

      it { expect(result).to eq(expected_result) }
    end
  end
end
