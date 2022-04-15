# frozen_string_literal: true

# This class models a Binary Search Tree (BST)
class BinarySearchTree
  # This class models the node used by the BST
  class Node
    attr_accessor :data, :left, :right

    def initialize(data)
      @data = data
      @left = nil
      @right = nil
    end
  end

  attr_accessor :root

  def initialize
    @root = nil
  end

  # value: Integer
  # return void
  def add(value)
    if @root.nil?
      @root = Node.new(value)
      return
    end

    add_recursive(value, @root)
  end

  def add_recursive(value, node)
    if value < node.data
      if node.left.nil?
        node.left = Node.new(value)
      else
        add_recursive(value, node.left)
      end
    elsif node.right.nil?
      node.right = Node.new(value)
    else
      add_recursive(value, node.right)
    end
  end

  def exists?(value)
    exists_recursive?(value, @root)
  end

  def exists_recursive?(value, node)
    return false if node.nil?

    return true if node.data == value

    exists_recursive?(value, node.left) || exists_recursive?(value, node.right)
  end

  def to_a
    to_a_recursive(@root, [])
  end

  def to_a_recursive(node, arr)
    return [] if node.nil?

    to_a_recursive(node.left, arr) unless node.left.nil?
    arr << node.data
    to_a_recursive(node.right, arr) unless node.right.nil?

    arr
  end

  def print_ordered
    print_ordered_recursive(root)
  end

  # node: Node
  def print_ordered_recursive(node)
    return if node.data.nil?

    print_ordered_recursive(node.left) unless node.left.nil?
    puts node.data
    print_ordered_recursive(node.right) unless node.right.nil?
  end
end
