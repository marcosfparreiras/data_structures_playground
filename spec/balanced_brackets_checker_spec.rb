# frozen_string_literal: true

require 'balanced_brackets_checker'

describe BalancedBracketsChecker do
  subject { BalancedBracketsChecker.new }

  describe '#check' do
    context 'when is balanced' do
      let(:string) { '[({()[{}]}[])]' }

      it 'returns true' do
        expect(subject.check(string)).to eq(true)
      end
    end
  end

  context 'when is not balanced' do
    context 'when it has remaining opening brackets' do
      let(:string) { '[({()[{}]}[])]{' }

      it 'returns false' do
        expect(subject.check(string)).to eq(false)
      end
    end

    context 'when closing bracket does not match' do
      let(:string) { '[({()[{)}]}[])]' }

      it 'returns false' do
        expect(subject.check(string)).to eq(false)
      end
    end
  end

  context 'when string is invalid' do
    let(:string) { '[({(a[{)}]}[])]' }

    it 'raises an ArgumentError' do
      expect { subject.check(string) }.to raise_error(ArgumentError)
    end
  end
end
