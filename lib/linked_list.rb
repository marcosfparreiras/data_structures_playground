# frozen_string_literal: true

require 'node'

#
# This class models a Linked List
#
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  # Adds a new item to the end of the Linked LIst
  # @param [Integer] value The value to be added to the list
  # @return [Node] The Node that was added to the list
  def append(value)
    if @head.nil?
      @head = Node.new(value)
      return value
    end

    current = @head
    until current.next_node.nil? # rubocop:disable Style/WhileUntilModifier
      current = current.next_node
    end
    current.next_node = Node.new(value)
  end

  # Adds a new item to the beginning of the Linked LIst
  # @param [Integer] value The value to be added to the list
  # @return [Node] The Node that was added to the list
  def prepend(value)
    new_head = Node.new(value)
    new_head.next_node = @head
    @head = new_head
    value
  end

  # Returns an array representation of the Linked List
  # @return [Array]
  def to_array
    array = []
    return array if @head.nil?

    node = @head
    until node.nil?
      array << node.value
      node = node.next_node
    end

    array
  end

  # Deletes firts occurency of a value in the Linked List
  # @param [Integer] value The value to be deleted
  # @return [Integer, nil] the value deleted
  def delete_with_value(value)
    return if @head.nil?

    if @head.value == value
      @head = @head.next_node
      return value
    end

    current = @head
    until current.next_node.nil?
      if current.next_node.value == value
        current.next_node = current.next_node.next_node
        return value
      end
      current = current.next_node
    end
    nil
  end
end
