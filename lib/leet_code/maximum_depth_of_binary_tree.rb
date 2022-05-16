# frozen_string_literal: true

module LeetCode
  # Mother class for MaximumDepthOfBinaryTree
  #
  # Implements the solution for the problem MaximumDepthOfBinaryTree,
  # from LeetCode, using 2 different approaches to go through the Binary Tree:
  # - DFS
  # - BFS
  #
  # The link for the problem in LeetCode is the following:
  # https://leetcode.com/problems/maximum-depth-of-binary-tree/
  #
  # The link for the submissions can be found at:
  # DFS: https://leetcode.com/submissions/detail/700287227/
  # BFS: https://leetcode.com/submissions/detail/700240675/
  class MaximumDepthOfBinaryTree
    # The TreeNode definition given in the problem
    class TreeNode
      attr_accessor :val, :left, :right

      def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
      end
    end

    def initialize(root)
      @root = root
    end
  end

  ##
  # Solution using DFS
  #
  # The idea to find the maximum depth of a binary tree using DFS is to simply
  # call the nodes recursively with DFS and setting the depth of each node as
  # being the greater depth of its children plus 1
  #
  # Time Complexity: O(n)
  #   - every node will be visited exactly once
  # Space Complexity: O(n)
  #   - the biggest call stack can't be bigger than the number of nodes
  #
  class MaximumDepthOfBinaryTreeDFS < MaximumDepthOfBinaryTree
    def find_maximum_depth
      find_maximum_depth_rec(@root)
    end

    private

    def find_maximum_depth_rec(node)
      return 0 if node.nil?

      left = find_maximum_depth_rec(node.left)
      right = find_maximum_depth_rec(node.right)

      [left, right].max + 1
    end
  end

  ##
  # Solution using BFS
  #
  # The idea to find the maximum depth of a binary tree using BFS is to simply
  # anayze each node using BFS and to use a queue that has values that combine
  # the node and its depth. With that, we can always set the depth of a child
  # as being the depth of the father + 1. Also, as we are using BFS, in order
  # to get the maximum depth, we just need to see the depth of the last node to
  # be analyzed
  #
  # Time Complexity: O(n)
  #   - every node will be visited exactly once
  # Space Complexity: O(n)
  #   - the queue used to analyze next nodes will be maximum of size n/2
  #
  class MaximumDepthOfBinaryTreeBFS < MaximumDepthOfBinaryTree
    # A helper class to wrap a node and its depth
    class NodeDepth
      attr_reader :node, :depth

      def initialize(node, depth)
        @node = node
        @depth = depth
      end
    end

    def find_maximum_depth
      return 0 if @root.nil?

      next_to_visit = [NodeDepth.new(@root, 1)]

      until next_to_visit.empty?
        current = next_to_visit.shift
        node = current.node
        depth = current.depth

        next_to_visit << NodeDepth.new(node.left, depth + 1) if node.left
        next_to_visit << NodeDepth.new(node.right, depth + 1) if node.right
      end
      depth
    end
  end
end

# # These lines are needed to run the code in LeetCode
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
# # @return {Integer}
# def max_depth(root)
#   MaximumDepthOfBinaryTreeDFS.new(root).find_maximum_depth
#   # MaximumDepthOfBinaryTree.new(root).find_maximum_depth
# end
