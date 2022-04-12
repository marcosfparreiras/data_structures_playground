# frozen_string_literal: true

# leetcode link: https://leetcode.com/problems/lru-cache/
require 'doubly_linked_list'

# Models a Least Recent Used Cache
# Complexity for the LRU Cache (n being the capacity)
# put
#   time complexity: O(1)
#   space_complexity: O(n)
#
# get
#   time complexity: O(1)
#   space_complexity: O(n)
#
#
# The implementation strategy:
# The LRU cache is implemented using a mix of a Hash and a DoublyLinkedList.
#   The DoublyLinkedList is needed to keep the order (LRU), allowing us to
#   remove any node with O(1), and prepend with O(1)
#
#   The Hash then maps the key to the Node in the DoublyLinkedListdList.
#   And, with that, reading a key has complexity O(1), and we can access the
#   node in O(1), we just need to remove/prepend it in the LinkedList when
#   needed
#
#   Another important point is that the Node has to keep both key and value.
#   This is needed because, when deleting the LRU, we need also to remove the
#   entry from the Hash, and we need to be able to map the node to the key
class LRUCache
  attr_reader :capacity, :list, :hash, :size

  # :type capacity: Integer
  def initialize(capacity)
    @capacity = capacity
    @list = DoublyLinkedList.new
    @hash = {} # String => Node
    @size = 0
  end

  # :type key: Integer
  # :rtype: Integer
  def get(key)
    node = @hash[key]
    return -1 if node.nil?

    @list.remove(node)
    @list.prepend(node)

    node.value
  end

  # :type key: Integer
  # :type value: Integer
  # :rtype: Void
  def put(key, value)
    existing_node = @hash[key]

    node = DoublyLinkedList::Node.new(key, value)
    @list.prepend(node)
    @hash[key] = node

    if existing_node.nil?
      @size += 1
    else
      @list.remove(existing_node)
    end

    ensure_capacity
    nil
  end

  private

  def ensure_capacity
    remove_lru if oversized?
  end

  def oversized?
    @size > @capacity
  end

  def remove_lru
    removed_node = @list.remove(@list.tail)
    # p removed_node
    # binding.pry
    @hash.delete(removed_node.key)
    @size -= 1
  end
end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
