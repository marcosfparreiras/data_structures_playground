# frozen_string_literal: true

require 'linked_list'

describe LinkedList do
  describe '#append' do
    subject { LinkedList.new }
    let(:new_node_value) { 1 }

    context 'when list is empty' do
      it 'sets the head to the new node' do
        subject.append(new_node_value)
        expect(subject.head.value).to eq(new_node_value)
      end
    end

    context 'when list is not empty' do
      let(:existing_node_value1) { 0 }
      let(:existing_node_value2) { 8 }

      before do
        subject.append(existing_node_value1)
        subject.append(existing_node_value2)
      end

      it 'appends the new node to the end of the list' do
        subject.append(new_node_value)
        expect(subject.head.next_node.next_node.value).to eq(new_node_value)
      end
    end
  end

  describe '#prepend' do
    subject { LinkedList.new }
    let(:new_node_value) { 1 }

    context 'when list is empty' do
      it 'sets the head to the new node' do
        subject.prepend(new_node_value)
        expect(subject.head.value).to eq(new_node_value)
      end
    end

    context 'when list is not empty' do
      let(:existing_node_value1) { 0 }
      let(:existing_node_value2) { 8 }

      before do
        subject.prepend(existing_node_value1)
        subject.prepend(existing_node_value2)
      end

      it 'prepends the new node to the beginning of the list' do
        subject.prepend(new_node_value)
        expect(subject.head.value).to eq(new_node_value)
        expect(subject.to_array).to eq([new_node_value, 8, 0])
      end
    end
  end

  describe '#to_array' do
    subject { LinkedList.new }

    context 'when list is empty' do
      it 'returns empty array' do
        expect(subject.to_array).to eq([])
      end
    end

    context 'when list is not empty' do
      before do
        subject.append(0)
        subject.append(1)
        subject.append(5)
        subject.append(2)
      end

      it 'returns empty array' do
        expect(subject.to_array).to eq([0, 1, 5, 2])
      end
    end
  end

  describe '#delete_with_value' do
    subject { LinkedList.new }

    before do
      subject.append(1)
      subject.append(2)
      subject.append(3)
      subject.append(1)
      subject.append(2)
    end

    context 'when list is empty' do
      let(:value) { 42 }
      it 'returns nil' do
        expect(subject.delete_with_value(value)).to eq(nil)
      end

      it 'does not delete anything' do
        expect(subject.to_array).to eq([1, 2, 3, 1, 2])
      end
    end

    context 'when value does not exist' do
      let(:value) { 42 }
      it 'returns nil' do
        expect(subject.delete_with_value(value)).to eq(nil)
      end

      it 'does not delete anything' do
        expect(subject.to_array).to eq([1, 2, 3, 1, 2])
      end
    end

    context 'when value is head' do
      let(:value) { 1 }

      context 'and head is only value' do
        let(:linked_list) { LinkedList.new }
        before { linked_list.append(1) }

        it 'returns the value deleted' do
          expect(linked_list.delete_with_value(value)).to eq(1)
        end

        it 'sets head to nil' do
          linked_list.delete_with_value(value)
          expect(linked_list.head).to eq(nil)
        end
      end

      context 'and head is not the only value' do
        it 'returns the value deleted' do
          expect(subject.delete_with_value(value)).to eq(1)
        end

        it 'deletes first ocurrency of the value' do
          subject.delete_with_value(value)
          expect(subject.to_array).to eq([2, 3, 1, 2])
        end
      end
    end

    context 'when value is not head' do
      let(:value) { 2 }
      it 'returns the value deleted' do
        expect(subject.delete_with_value(value)).to eq(2)
      end

      it 'deletes first ocurrency of the value' do
        subject.delete_with_value(value)
        expect(subject.to_array).to eq([1, 3, 1, 2])
      end
    end
  end
end
