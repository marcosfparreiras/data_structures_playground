# frozen_string_literal: true

require 'doubly_linked_list'

describe DoublyLinkedList do
  subject { DoublyLinkedList.new }

  describe '#prepend' do
    let(:node_to_add) { DoublyLinkedList::Node.new(1, 1) }
    let(:existing_node) { DoublyLinkedList::Node.new(7, 8) }

    context 'when list is empty' do
      before { subject.prepend(node_to_add) }

      it 'sets head to node' do
        expect(subject.head).to eq(node_to_add)
      end

      it 'sets tail to node' do
        expect(subject.tail).to eq(node_to_add)
      end

      it 'does not set head.next' do
        expect(subject.head.next).to be_nil
      end

      it 'does not set tail.previous' do
        expect(subject.tail.previous).to be_nil
      end
    end

    context 'when list is not empty' do
      before do
        @original_head = subject.prepend(existing_node)
        subject.prepend(node_to_add)
      end

      it 'adds new node to the head' do
        expect(subject.head).to eq(node_to_add)
      end

      it 'points previous head.previous to new node' do
        expect(@original_head.previous).to eq(node_to_add)
      end
    end
  end

  describe '#remove' do
    let(:node1) { DoublyLinkedList::Node.new(1, 1) }
    let(:node2) { DoublyLinkedList::Node.new(3, 6) }
    let(:node3) { DoublyLinkedList::Node.new(12, 3) }

    context 'when list gets empty' do
      let(:node) { DoublyLinkedList::Node.new(1, 1) }
      before { subject.prepend(node) }

      it 'sets head to nil' do
        subject.remove(node)
        expect(subject.head).to be_nil
      end

      it 'sets tail to nil' do
        subject.remove(node)
        expect(subject.tail).to be_nil
      end
    end

    context 'when list gets to one element' do
      before do
        subject.prepend(node1)
        subject.prepend(node2)
      end

      it 'head and tail point to the remaining node' do
        subject.remove(node1)
        expect(subject.head).to eq(node2)
        expect(subject.tail).to eq(node2)
      end

      it 'head.previous and tail.next are set to nil' do
        subject.remove(node1)
        expect(subject.head.previous).to be_nil
        expect(subject.tail.next).to be_nil
      end
    end

    context 'when list does not get empty' do
      before do
        subject.prepend(node1)
        subject.prepend(node2)
        subject.prepend(node3)
      end

      it 'links previous node and next node' do
        subject.remove(node2)

        expect(node3.next).to eq(node1)
        expect(node1.previous).to eq(node3)
      end
    end
  end

  describe 'integration' do
    let(:node1) { DoublyLinkedList::Node.new(1, 1) }
    let(:node2) { DoublyLinkedList::Node.new(3, 6) }
    let(:node3) { DoublyLinkedList::Node.new(12, 3) }
    let(:node4) { DoublyLinkedList::Node.new(2, 3) }
    let(:node5) { DoublyLinkedList::Node.new(15, 3) }
    let(:node6) { DoublyLinkedList::Node.new(52, 44) }
    let(:node7) { DoublyLinkedList::Node.new(62, 33) }

    before do
      subject.prepend(node2)
      subject.remove(node2)

      subject.prepend(node3)
      subject.prepend(node4)
      subject.remove(node4)

      subject.prepend(node5)
      subject.prepend(node6)
      subject.prepend(node7)
      subject.remove(node6)
    end

    let(:expect_result_forward) { [node7.to_a, node5.to_a, node3.to_a] }
    let(:expect_result_backward) { [node3.to_a, node5.to_a, node7.to_a] }

    it 'sets list with the right connections forward' do
      expect(subject.to_a_forward).to eq(expect_result_forward)
    end

    it 'sets list with the right connections backward' do
      expect(subject.to_a_backward).to eq(expect_result_backward)
    end
  end
end
