# frozen_string_literal: true

# Models a Doubly Linked List
class DoublyLinkedList
  # Models a Node used for a Doubly Linked List
  class Node
    attr_accessor :key, :value, :next, :previous

    # Initilzer for Node
    # @param [Integer] key
    # @param [Integer] value
    def initialize(key, value)
      @key = key
      @value = value
      @next = nil
      @previous = nil
    end

    def to_a
      [@key, @value]
    end
  end

  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # Prepends a node to the list
  # @param [Node] node The node to be prepended
  # @return [Node] the prepended node
  def prepend(node)
    node.next = @head
    @head.previous = node unless @head.nil?

    @head = node
    @tail = node if @tail.nil?
    node
  end

  def remove(node)
    return nil if node.nil?

    @head = node.next if node == @head
    @tail = node.previous if node == @tail

    next_node = node.next
    previous_node = node.previous

    next_node.previous = previous_node unless next_node.nil?
    previous_node.next = next_node unless previous_node.nil?
    node
  end

  def to_a_forward
    arr = []
    current = @head
    until current.nil?
      arr << current.to_a
      current = current.next
    end
    arr
  end

  def to_a_backward
    arr = []
    current = @tail
    until current.nil?
      arr << current.to_a
      current = current.previous
    end
    arr
  end
end
