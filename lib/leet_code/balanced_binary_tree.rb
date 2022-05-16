# frozen_string_literal: true

module LeetCode
  # Implements the solution for the problem BalancedBinaryTree, from LeetCode
  #
  # The link for the problem in LeetCode is the following:
  # https://leetcode.com/problems/balanced-binary-tree/
  #
  # The link for the submissions can be found at:
  # https://leetcode.com/submissions/detail/700594146/
  class BalancedBinaryTree
    # The TreeNode definition given in the problem
    class TreeNode
      attr_accessor :val, :left, :right

      def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
      end
    end

    # A helper class to keep track of needed information to see if a node is
    # balanced: its height and if it is balanced
    class NodeInfo
      attr_reader :height, :balanced

      # height: Integer
      # balanced: Boolean
      def initialize(height, balanced)
        @height = height
        @balanced = balanced
      end
    end

    def initialize(root)
      @root = root
    end

    # Time complexity: O(n)
    #   - every node will be visited exactly once
    # Space complexity: O(n)
    #   - the biggest call stack can't be bigger than the number of nodes
    #
    # How does it work?
    # We perform a DFS on the tree, and on the backtracking, we keep track of
    # the height of each node, and also if it's balanced. We represent this
    # combination using the class NodeInfo.
    # The recursion works in the following way:
    # - if the node is nil, then we return a NodeInfo with height 0 and balanced
    #   flag set to true
    # - then, this node's parent will check if all the children are balanced and
    #   will set its height to the heighest child depth + 1, and it will be set
    #   as balanced if both children are balanced and also the difference in
    #   depth between them is not greater than 1.
    # - the method balanced_rec? will return the NodeInfo related to the root,
    #   given that this was the starting point of the recursion. Then, we just
    #   need to check if it is balanced
    #
    def balanced?
      balanced_rec?(@root).balanced
    end

    private

    # node: Node
    # returns NodeInfo
    def balanced_rec?(node)
      return NodeInfo.new(0, true) if node.nil?

      left = balanced_rec?(node.left)
      right = balanced_rec?(node.right)

      left_height = left.height
      right_height = right.height

      balanced = left.balanced && right.balanced && (left_height - right_height).abs <= 1
      NodeInfo.new([left_height, right_height].max + 1, balanced)
    end
  end
end

# # This lines are needed to run the code on LeetCode
# #
# # Definition for a binary tree node.
# # class TreeNode
# #     attr_accessor :val, :left, :right
# #     def initialize(val = 0, left = nil, right = nil)
# #         @val = val
# #         @left = left
# #         @right = right
# #     end
# # end
# # @param {TreeNode} root
# # @return {Boolean}
# def is_balanced(root)
#   LeetCode::BalancedBinaryTree.new(root).balanced?
# end
