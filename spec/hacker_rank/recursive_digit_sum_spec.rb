
require 'hacker_rank/recursive_digit_sum'


describe HackerRank::RecursiveDigitSum do
	subject { HackerRank::RecursiveDigitSum.new(string_number, repetition_times) }

	describe '#super_digit' do
    context 'when initial number has only one digit' do
      let(:string_number) { '2' }
      let(:repetition_times) { 3 }
      let(:expected_value) { 6 }

      it { expect(subject.super_digit).to eq(expected_value) }
    end

    context 'when initial number has multiple digits' do
      context 'example 1' do
        let(:string_number) { '9875' }
        let(:repetition_times) { 4 }
        let(:expected_value) { 8 }

        it { expect(subject.super_digit).to eq(expected_value) }
      end

      context 'example 2' do
        let(:string_number) { '148' }
        let(:repetition_times) { 3 }
        let(:expected_value) { 3 }

        it { expect(subject.super_digit).to eq(expected_value) }
      end

      context 'example 3' do
        let(:string_number) { '123' }
        let(:repetition_times) { 3 }
        let(:expected_value) { 9 }

        it { expect(subject.super_digit).to eq(expected_value) }
      end
    end

    context 'when entry is really big' do
      let(:string_number) { (10**100_000).to_s }
      let(:repetition_times) { 10^5 }
      let(:expected_value) { 6 }

      it { expect(subject.super_digit).to eq(expected_value) }
    end
  end
end



