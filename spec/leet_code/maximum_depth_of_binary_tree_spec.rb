# frozen_string_literal: true

require 'leet_code/maximum_depth_of_binary_tree'

RSpec.shared_examples 'maximum depth of binary tree' do
  let(:subject) { klass.new(root) }

  describe '#find_maximum_depth' do
    let(:result) { subject.find_maximum_depth }

    context 'example 1' do
      let(:root) do
        node3 = LeetCode::MaximumDepthOfBinaryTree::TreeNode.new(3)
        node9 = LeetCode::MaximumDepthOfBinaryTree::TreeNode.new(9)
        node20 = LeetCode::MaximumDepthOfBinaryTree::TreeNode.new(20)
        node15 = LeetCode::MaximumDepthOfBinaryTree::TreeNode.new(15)
        node7 = LeetCode::MaximumDepthOfBinaryTree::TreeNode.new(7)

        node3.left = node9
        node3.right = node20
        node20.left = node15
        node20.right = node7

        node3
      end

      let(:expected_result) { 3 }

      it { expect(result).to eq(expected_result) }
    end

    context 'example 2' do
      let(:root) do
        node1 = LeetCode::MaximumDepthOfBinaryTree::TreeNode.new(1)
        node2 = LeetCode::MaximumDepthOfBinaryTree::TreeNode.new(2)

        node1.right = node2

        node1
      end

      let(:expected_result) { 2 }

      it { expect(result).to eq(expected_result) }
    end
  end
end

describe LeetCode::MaximumDepthOfBinaryTreeDFS do
  it_behaves_like 'maximum depth of binary tree' do
    let(:klass) { LeetCode::MaximumDepthOfBinaryTreeDFS }
  end
end

describe LeetCode::MaximumDepthOfBinaryTreeBFS do
  it_behaves_like 'maximum depth of binary tree' do
    let(:klass) { LeetCode::MaximumDepthOfBinaryTreeBFS }
  end
end
