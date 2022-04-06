# frozen_string_literal: true

#
# This class models a node that has a data and a pointer to one other node
#
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
