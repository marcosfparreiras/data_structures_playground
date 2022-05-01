
require 'hacker_rank/special_string'

describe HackerRank::SpecialString do
  subject { HackerRank::SpecialString.new(string) }

  describe '#count_special_substrings' do
    context 'HackerRank example tests' do
      context 'example 1' do
        let(:string) { 'mnonopoo'}
        let(:expected_result) { 12 }
        it { expect(subject.count_special_substrings).to eq(expected_result) }
      end

      context 'example 2' do
        let(:string) { 'abcbaba'}
        let(:expected_result) { 10 }
        it { expect(subject.count_special_substrings).to eq(expected_result) }
      end
    end



    context 'when size 1' do
      let(:string) { 'a'}
      let(:expected_result) { 1 }
      it { expect(subject.count_special_substrings).to eq(expected_result) }
    end

    context 'when only one repeated letter' do
      let(:string) { 'aaaa' }
      let(:expected_result) { 10 }
      it { expect(subject.count_special_substrings).to eq(expected_result) }
    end

    context 'when contains long invalid by position' do
      let(:string) { 'onooooooabaaaaaaaaoijeijfeijfaoi' }
      let(:expected_result) { 77 }
      it { expect(subject.count_special_substrings).to eq(expected_result) }
    end
  end
end
