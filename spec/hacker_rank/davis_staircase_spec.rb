# frozen_string_literal: true

require 'hacker_rank/davis_staircase'

describe HackerRank::DavisStaircase do
  subject { HackerRank::DavisStaircase.new(steps) }

  describe '#count' do
    context 'example 1' do
      let(:steps) { 1 }
      let(:expected_result) { 1 }
      it { expect(subject.count).to eq(expected_result) }
    end

    context 'example 2' do
      let(:steps) { 3 }
      let(:expected_result) { 4 }
      it { expect(subject.count).to eq(expected_result) }
    end

    context 'example 3' do
      let(:steps) { 7 }
      let(:expected_result) { 44 }
      it { expect(subject.count).to eq(expected_result) }
    end

    context 'example 4' do
      let(:steps) { 20 }
      let(:expected_result) { 121_415 }
      it { expect(subject.count).to eq(expected_result) }
    end

    context 'example 5' do
      let(:steps) { 27 }
      let(:expected_result) { 8_646_064 }
      it { expect(subject.count).to eq(expected_result) }
    end
  end
end

RSpec.shared_examples 'steps counter' do
  let(:subject) { klass.new(steps) }

  describe '#count_ways' do
    context 'when 0' do
      let(:steps) { 0 }
      it { expect(subject.count) }
    end

    context 'when 1' do
      let(:steps) { 1 }
      let(:expected_result) { 1 }
      it { expect(subject.count).to eq(expected_result) }
    end

    context 'when 2' do
      let(:steps) { 2 }
      let(:expected_result) { 2 }
      it { expect(subject.count).to eq(expected_result) }
    end

    context 'when 3' do
      let(:steps) { 3 }
      let(:expected_result) { 4 }
      it { expect(subject.count).to eq(expected_result) }
    end

    context 'when 4' do
      let(:steps) { 4 }
      let(:expected_result) { 7 }
      it { expect(subject.count).to eq(expected_result) }
    end

    context 'when 5' do
      let(:steps) { 5 }
      let(:expected_result) { 13 }
      it { expect(subject.count).to eq(expected_result) }
    end
  end
end

describe HackerRank::StepsCounterRecursive do
  it_behaves_like 'steps counter' do
    let(:klass) { HackerRank::StepsCounterRecursive }
  end
end

describe HackerRank::StepsCounterRecursiveMemoization do
  it_behaves_like 'steps counter' do
    let(:klass) { HackerRank::StepsCounterRecursiveMemoization }
  end
end

describe HackerRank::StepsCounterDinamicProgramming do
  it_behaves_like 'steps counter' do
    let(:klass) { HackerRank::StepsCounterDinamicProgramming }
  end
end

describe HackerRank::StepsCounterBase do
  subject { HackerRank::StepsCounterBase.new(1) }
  describe '#count' do
    it 'raises an exception' do
      expect { subject.count }.to raise_error(StandardError)
    end
  end
end
