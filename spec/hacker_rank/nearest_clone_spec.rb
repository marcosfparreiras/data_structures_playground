# frozen_string_literal: true

require 'hacker_rank/nearest_clone'

describe HackerRank::NearestClone do
  subject { described_class.new(n_nodes, graph_from, graph_to, color_ids) }

  describe '#find_nearest_clone' do
    let(:result) { subject.find_nearest_clone(color_id) }

    context 'example 1' do
      let(:n_nodes) { 4 }
      let(:graph_from) { [1, 1, 4] }
      let(:graph_to) { [2, 3, 2] }
      let(:color_ids) { [1, 2, 1, 1] }
      let(:color_id) { 1 }
      let(:expected_result) { 1 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 2' do
      let(:n_nodes) { 4 }
      let(:graph_from) { [1, 1, 4] }
      let(:graph_to) { [2, 3, 2] }
      let(:color_ids) { [1, 2, 3, 4] }
      let(:color_id) { 3 }
      let(:expected_result) { -1 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 3' do
      let(:n_nodes) { 5 }
      let(:graph_from) { [1, 1, 2, 3] }
      let(:graph_to) { [2, 3, 4, 5] }
      let(:color_ids) { [1, 2, 3, 3, 2] }
      let(:color_id) { 2 }
      let(:expected_result) { 3 }

      it { expect(result).to eq(expected_result) }
    end
  end
end
