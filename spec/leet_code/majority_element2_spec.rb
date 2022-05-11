# frozen_string_literal: true

require 'leet_code/majority_element2'

describe LeetCode::MajorityElement2 do
  subject { described_class.new(nums) }

  RSpec.shared_examples 'implementation of find' do
    context 'example 1' do
      let(:nums) { [3, 2, 3] }
      let(:expected_result) { [3] }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 2' do
      let(:nums) { [4, 2, 1, 1, 2, 3, 2, 1, 6, 1] }
      let(:expected_result) { [1] }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 3' do
      let(:nums) { [4, 2, 1, 1, 2, 3, 2, 1, 6, 1, 2, 2, 2, 2, 1, 1, 1] }
      let(:expected_result) { [1, 2] }

      it { expect(result).to eq(expected_result) }
    end
  end

  describe '#find_space_o_n' do
    it_behaves_like 'implementation of find' do
      let(:result) { subject.find_space_o_n }
    end
  end

  describe '#find_space_o1' do
    it_behaves_like 'implementation of find' do
      let(:result) { subject.find_space_o1 }
    end
  end
end
