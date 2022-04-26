# frozen_string_literal: true

require 'hacker_rank/sherlock_and_anagrams'

describe HackerRank::SherlockAndAnagrams do
  subject { HackerRank::SherlockAndAnagrams.new(string) }

  describe '#find_anagrams_count' do
    context 'example 1' do
      let(:string) { 'abba' }
      let(:expected_value) { 4 }

      it { expect(subject.find_anagrams_count).to eq(expected_value) }
    end

    context 'example 2' do
      let(:string) { 'abcd' }
      let(:expected_value) { 0 }

      it { expect(subject.find_anagrams_count).to eq(expected_value) }
    end

    context 'example 3' do
      let(:string) { 'ifailuhkqq' }
      let(:expected_value) { 3 }

      it { expect(subject.find_anagrams_count).to eq(expected_value) }
    end

    context 'example 4' do
      let(:string) { 'kkkk' }
      let(:expected_value) { 10 }

      it { expect(subject.find_anagrams_count).to eq(expected_value) }
    end

    context 'example 5' do
      let(:string) { 'cdcd' }
      let(:expected_value) { 5 }

      it { expect(subject.find_anagrams_count).to eq(expected_value) }
    end
  end
end
