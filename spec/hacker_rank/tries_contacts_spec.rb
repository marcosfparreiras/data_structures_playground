# frozen_string_literal: true

require 'hacker_rank/tries_contacts'

describe HackerRank::TriesContacts do
  subject { HackerRank::TriesContacts.new }

  describe '#add and #find_count' do
    before do
      words_to_add.each { |word| subject.add(word) }
    end

    context 'example1' do
      let(:words_to_add) { %w[hack hacker_rank] }
      let(:find_partials) { %w[hac hak] }
      let(:expected_result) { [2, 0] }

      it 'finds right partials' do
        result = find_partials.map { |partial| subject.find_count(partial) }
        expect(result).to eq(expected_result)
      end
    end

    context 'example2' do
      let(:words_to_add) { %w[s ss sss ssss sssss] }
      let(:find_partials) { %w[s ss sss ssss sssss] }
      let(:expected_result) { [5, 4, 3, 2, 1] }

      it 'finds right partials' do
        result = find_partials.map { |partial| subject.find_count(partial) }
        expect(result).to eq(expected_result)
      end
    end
  end
end
