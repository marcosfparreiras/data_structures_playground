# frozen_string_literal: true

require 'leet_code/minimum_genetic_mutation'

describe LeetCode::MinimumGeneticMutation do
  subject { described_class.new(start_gene, end_gene, genes_bank) }

  describe '#find_mininum_mutations' do
    let(:result) { subject.find_mininum_mutations }
    context 'example 1' do
      let(:start_gene) { 'AACCGGTT' }
      let(:end_gene) { 'AACCGGTA' }
      let(:genes_bank) { ['AACCGGTA'] }
      let(:expected_result) { 1 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 2' do
      let(:start_gene) { 'AACCGGTT' }
      let(:end_gene) { 'AAACGGTA' }
      let(:genes_bank) { %w[AACCGGTA AACCGCTA AAACGGTA] }
      let(:expected_result) { 2 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 3' do
      let(:start_gene) { 'AAAAACCC' }
      let(:end_gene) { 'AACCCCCC' }
      let(:genes_bank) { %w[AAAACCCC AAACCCCC AACCCCCC] }
      let(:expected_result) { 3 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 4' do
      let(:start_gene) { 'AAAAACCC' }
      let(:end_gene) { 'GACCCCCC' }
      let(:genes_bank) { %w[AAAACCCC AAACCCCC AACCCCCC] }
      let(:expected_result) { -1 }

      it { expect(result).to eq(expected_result) }
    end
  end
end
