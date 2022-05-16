# frozen_string_literal: true

require 'leet_code/balanced_binary_tree'

describe LeetCode::BalancedBinaryTree do
  subject { LeetCode::BalancedBinaryTree.new(root) }

  describe '#balanced?' do
    let(:result) { subject.balanced? }

    context 'example 1' do
      let(:root) do
        node3 = LeetCode::BalancedBinaryTree::TreeNode.new(3)
        node9 = LeetCode::BalancedBinaryTree::TreeNode.new(9)
        node20 = LeetCode::BalancedBinaryTree::TreeNode.new(20)
        node15 = LeetCode::BalancedBinaryTree::TreeNode.new(15)
        node7 = LeetCode::BalancedBinaryTree::TreeNode.new(7)

        node3.left = node9
        node3.right = node20
        node20.left = node15
        node20.right = node7

        node3
      end
      let(:expected_result) { true }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 2' do
      let(:root) do
        node1 = LeetCode::BalancedBinaryTree::TreeNode.new(1)
        node2a = LeetCode::BalancedBinaryTree::TreeNode.new(2)
        node2b = LeetCode::BalancedBinaryTree::TreeNode.new(2)
        node3a = LeetCode::BalancedBinaryTree::TreeNode.new(3)
        node3b = LeetCode::BalancedBinaryTree::TreeNode.new(3)
        node4a = LeetCode::BalancedBinaryTree::TreeNode.new(4)
        node4b = LeetCode::BalancedBinaryTree::TreeNode.new(4)

        node1.left = node2a
        node1.right = node2b
        node2a.left = node3a
        node2a.right = node3b
        node3a.left = node4a
        node3a.right = node4b

        node1
      end
      let(:expected_result) { false }

      it { expect(result).to eq(expected_result) }
    end
  end
end
