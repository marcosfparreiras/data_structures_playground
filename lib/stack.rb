# frozen_string_literal: true

require 'node'

#
# This class models a Stack
#
class Stack
  attr_reader :top

  def initialize
    @top = nil
  end

  def empty?
    @top.nil?
  end

  def peek
    return nil if @top.nil?

    @top.value
  end

  def push(value)
    node = Node.new(value)
    node.next_node = @top
    @top = node
    value
  end

  def pop
    return nil if @top.nil?

    old_top = @top
    @top = old_top.next_node
    old_top.value
  end
end
