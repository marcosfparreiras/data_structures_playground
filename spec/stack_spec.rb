# frozen_string_literal: true

require 'stack'

describe Stack do
  subject { Stack.new }

  describe '#empty?' do
    context 'when stack is empty' do
      it 'is true' do
        expect(subject.empty?).to eq(true)
      end
    end

    context 'when stack is not empty' do
      before { subject.push(1) }
      it 'is false' do
        expect(subject.empty?).to eq(false)
      end
    end
  end

  describe '#push' do
    context 'when stack is empty' do
      it 'adds new value to top of stack' do
        subject.push(0)
        expect(subject.peek).to eq(0)
      end
    end

    context 'when stack is not empty' do
      before { subject.push(1) }
      it 'adds new value to top of stack' do
        subject.push(0)
        expect(subject.peek).to eq(0)
      end

      it 'new node points to previous top' do
        subject.push(0)
        expect(subject.top.next_node.value).to eq(1)
      end
    end
  end

  describe '#pop' do
    context 'when stak is empty' do
      it 'returns nil' do
        expect(subject.pop).to eq(nil)
      end
    end

    context 'when stack is not empty' do
      before do
        subject.push(1)
        subject.push(2)
      end

      it 'returns value of top' do
        expect(subject.pop).to eq(2)
      end

      it 'sets top to be next element in the stack' do
        subject.pop
        expect(subject.peek).to eq(1)
      end
    end
  end

  describe '#peek' do
    it 'returns the value of the top of stack' do
      subject.push(1)
      expect(subject.peek).to eq(1)
    end
  end
end
