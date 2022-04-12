# frozen_string_literal: true

require 'lru_cache'

describe LRUCache do
  let(:capacity) { 3 }
  subject { LRUCache.new(capacity) }

  describe '#put' do
    context 'when adding a key' do
      it 'sets params correctly' do
        subject.put(1, 4)
        expect(subject.size).to eq(1)
        expect(subject.hash[1].key).to eq(1)
        expect(subject.hash[1].value).to eq(4)
        expect(subject.hash.keys).to eq([1])
        expect(subject.list.head.key).to eq(1)
        expect(subject.list.head.value).to eq(4)
        expect(subject.list.tail.key).to eq(1)
        expect(subject.list.tail.value).to eq(4)
      end
    end

    context 'when overriding an existing key' do
      before { subject.put(1, 4) }

      it 'sets params correctly' do
        subject.put(1, 4)
        expect(subject.size).to eq(1)
        expect(subject.hash[1].key).to eq(1)
        expect(subject.hash[1].value).to eq(4)
        expect(subject.hash.keys).to eq([1])
        expect(subject.list.head.key).to eq(1)
        expect(subject.list.head.value).to eq(4)
        expect(subject.list.tail.key).to eq(1)
        expect(subject.list.tail.value).to eq(4)
      end
    end

    context 'when size goes over capacity' do
      before do
        subject.put(1, 11)
        subject.put(2, 12)
        subject.put(3, 13)
        subject.put(4, 14)
      end

      it 'sets params correctly' do
        expect(subject.size).to eq(3)
        expect(subject.hash.keys.sort).to eq([2, 3, 4])
        expect(subject.list.head.key).to eq(4)
        expect(subject.list.head.value).to eq(14)
        expect(subject.list.tail.key).to eq(2)
        expect(subject.list.tail.value).to eq(12)
      end
    end
  end

  describe '#get' do
    context 'when getting non-cached value' do
      before do
        subject.put(1, 11)
        subject.put(2, 12)
        subject.put(3, 13)
        subject.put(4, 14)
      end

      context 'when key had alredy been in cache' do
        it 'returns -1' do
          expect(subject.get(1)).to eq(-1)
        end
      end

      context 'when key had never been in cache' do
        it 'returns -1' do
          expect(subject.get(7)).to eq(-1)
        end
      end
    end
  end

  describe 'integration' do
    let(:capacity) { 5 }

    before do
      subject.put(1, 11)
      subject.put(2, 12)
      subject.get(1)
      subject.get(2)
      subject.put(1, 14)
      subject.put(4, 14)
      subject.put(6, 16)
      subject.put(5, 15)
      subject.put(3, 13)
      subject.get(1)
      subject.put(7, 17)

      subject.put(3, 16)
      subject.put(6, 26)
      subject.put(2, 19)
      subject.get(3)
      subject.get(4)
      subject.put(8, 18)
    end

    # 8-18 3-16 2-19 6-26 7-17
    let(:expected_key_value_values) do
      [
        [8, 18],
        [3, 16],
        [2, 19],
        [6, 26],
        [7, 17]
      ]
    end

    it 'has all params set correctly' do
      expect(subject.size).to eq(5)
      expect(subject.hash.keys.sort).to eq([2, 3, 6, 7, 8])
      expect(subject.list.head.key).to eq(8)
      expect(subject.list.head.value).to eq(18)
      expect(subject.list.tail.key).to eq(7)
      expect(subject.list.tail.value).to eq(17)
      expect(subject.list.to_a_forward).to eq(expected_key_value_values)
    end
  end
end
