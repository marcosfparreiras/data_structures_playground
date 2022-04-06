# frozen_string_literal: true

require 'node'

describe Node do
  let(:node_value) { 1 }
  let(:next_node_value) { 2 }

  it 'can be initialized with value only' do
    node = Node.new(node_value)
    expect(node.value).to eq(node_value)
  end

  it 'can be initialized with value and next_node' do
    next_node = Node.new(next_node_value)
    node = Node.new(node_value, next_node)

    expect(node.value).to eq(1)
    expect(node.next_node).to eq(next_node)
  end

  it 'can set the next node' do
    node = Node.new(node_value)
    node.next_node = Node.new(next_node_value)
    expect(node.next_node.value).to eq(next_node_value)
  end
end
