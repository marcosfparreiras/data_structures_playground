# frozen_string_literal: true

require 'leet_code/roman_to_integer'

describe LeetCode::RomanToInteger do
  subject { LeetCode::RomanToInteger }

  describe '#convert' do
    let(:result) { subject.convert(roman_num) }

    context 'example 1' do
      let(:roman_num) { 'III' }
      let(:expected_result) { 3 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 2' do
      let(:roman_num) { 'LVIII' }
      let(:expected_result) { 58 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 2' do
      let(:roman_num) { 'MCMXCIV' }
      let(:expected_result) { 1994 }

      it { expect(result).to eq(expected_result) }
    end
  end
end
