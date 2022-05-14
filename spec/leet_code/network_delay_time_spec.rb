# frozen_string_literal: true

require 'leet_code/network_delay_time'

describe LeetCode::NetworkDelayTime do
  subject { LeetCode::NetworkDelayTime.new(times, num_nodes) }

  describe '#find_total_transmission_delay' do
    let(:result) { subject.find_total_transmission_delay(initial_node) }

    context 'example 1' do
      let(:times) { [[1, 2, 1]] }
      let(:num_nodes) { 2 }
      let(:initial_node) { 2 }
      let(:expected_result) { -1 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 2' do
      let(:times) { [[1, 2, 1]] }
      let(:num_nodes) { 2 }
      let(:initial_node) { 1 }
      let(:expected_result) { 1 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 3' do
      let(:times) { [[2, 1, 1], [2, 3, 1], [3, 4, 1]] }
      let(:num_nodes) { 4 }
      let(:initial_node) { 2 }
      let(:expected_result) { 2 }

      it { expect(result).to eq(expected_result) }
    end
  end
end
