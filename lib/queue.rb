# frozen_string_literal: true

require 'node'

#
# This class models a Queue
#
class Queue
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def peek
    return nil if @head.nil?

    @head.value
  end

  def empty?
    return true if @head.nil?

    false
  end

  def add(value)
    node = Node.new(value)

    @tail.next_node = node unless @tail.nil?
    @tail = node
    @head = node if @head.nil?
    value
  end

  def remove
    return nil if @head.nil?

    value = @head.value
    @head = @head.next_node
    @tail = nil if @head.nil?
    value
  end
end
