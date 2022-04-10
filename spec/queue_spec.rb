# frozen_string_literal: true

require 'queue'

describe Queue do
  subject { Queue.new }

  describe '#peek' do
    context 'when queue is empty' do
      it 'returns nil' do
        expect(subject.peek).to be_nil
      end
    end

    context 'when queue is not empty' do
      before { subject.add(4) }
      it 'returns value of the head node' do
        expect(subject.peek).to eq(4)
      end
    end
  end

  describe '#empty?' do
    context 'when queue is empty' do
      it 'is true' do
        expect(subject.empty?).to eq(true)
      end
    end

    context 'when queue is not empty' do
      before { subject.add(3) }

      it 'is false' do
        expect(subject.empty?).to eq(false)
      end
    end
  end

  describe '#add' do
    context 'when queue is empty' do
      it 'sets item as head' do
        subject.add(3)
        expect(subject.head.value).to eq(3)
      end

      it 'sets item as tail' do
        subject.add(3)
        expect(subject.tail.value).to eq(3)
      end
    end

    context 'when queue is not empty' do
      before { subject.add(4) }

      it 'adds item correctly to the tail of the queue' do
        subject.add(3)
        expect(subject.tail.value).to eq(3)
      end

      it 'does not change head' do
        subject.add(3)
        expect(subject.head.value).to eq(4)
      end
    end
  end

  describe '#remove' do
    context 'when queue is empty' do
      it 'returns nil' do
        expect(subject.remove).to be_nil
      end
    end

    context 'when queue has only one element' do
      before { subject.add(3) }

      it 'returns tail value' do
        expect(subject.remove).to eq(3)
      end

      it 'sets head to nil' do
        subject.remove
        expect(subject.head).to be_nil
      end

      it 'sets tail to nil' do
        subject.remove
        expect(subject.tail).to be_nil
      end
    end

    context 'when queue has more than one element' do
      before do
        subject.add(2)
        subject.add(3)
      end

      it 'returns the tail' do
        expect(subject.remove).to eq(2)
      end

      it 'sets head to head next node' do
        subject.remove
        expect(subject.head.value).to eq(3)
      end
    end
  end
end
