# frozen_string_literal: true

require 'binary_search_tree'

describe BinarySearchTree do
  subject { BinarySearchTree.new }

  describe '#add' do
    context 'when tree is empty' do
      it 'sets root with the added value' do
        subject.add(3)
        expect(subject.root.data).to eq(3)
      end
    end

    context 'when tree is not empty' do
      before do
        subject.add(3)
        subject.add(5)
        subject.add(1)
        subject.add(4)
      end

      it 'adds the values in right sort position' do
        expect(subject.root.data).to eq(3)
        expect(subject.root.right.data).to eq(5)
        expect(subject.root.left.data).to eq(1)
        expect(subject.root.right.left.data).to eq(4)
      end
    end
  end

  describe '#exists?' do
    before do
      subject.add(3)
      subject.add(7)
      subject.add(4)
      subject.add(9)
      subject.add(1)
    end

    context 'when value exists' do
      it 'returns true' do
        expect(subject.exists?(4)).to eq(true)
      end
    end

    context 'when value does not exist' do
      it 'returns false' do
        expect(subject.exists?(8)).to eq(false)
      end
    end
  end

  describe '#to_a' do
    context 'when BST is not empty' do
      before do
        subject.add(8)
        subject.add(7)
        subject.add(3)
        subject.add(9)
        subject.add(2)
        subject.add(4)
        subject.add(10)
        subject.add(12)
        subject.add(6)
      end

      let(:expected_result) { [2, 3, 4, 6, 7, 8, 9, 10, 12] }

      it 'returns the sorted array' do
        expect(subject.to_a).to eq(expected_result)
      end
    end

    context 'when BST is empty' do
      it 'returns an empty array' do
        expect(subject.to_a).to eq([])
      end
    end
  end

  describe '#print_ordered' do
    before do
      subject.add(3)
      subject.add(7)
      subject.add(4)
      subject.add(9)
      subject.add(1)
    end

    it 'prints elements in right order' do
      expect do
        subject.print_ordered
      end.to output("1\n3\n4\n7\n9\n").to_stdout
    end
  end
end
