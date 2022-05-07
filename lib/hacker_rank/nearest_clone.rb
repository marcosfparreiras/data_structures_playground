# frozen_string_literal: true

require 'set'

module HackerRank
  # This class implements the solution to the NearestClone problem from
  # Hacker Rank.
  #
  # The link for the problem in HackerRank is the following:
  # https://www.hackerrank.com/challenges/find-the-nearest-clone/problem
  class NearestClone
    # This classes models the Node used by the NearestClone problem, in which
    # each node has a value, a color id, and multiple children nodes
    class Node
      attr_accessor :value, :color_id, :nodes

      def initialize(value, color_id)
        @value = value
        @color_id = color_id
        @nodes = []
      end

      def add_node(node)
        @nodes << node
      end
    end
    NO_PATH_CODE = -1

    def initialize(n_nodes, graph_from, graph_to, color_ids)
      @n_nodes = n_nodes
      @graph_from = to_zero_indexed(graph_from)
      @graph_to = to_zero_indexed(graph_to)
      @color_ids = color_ids

      # @graph_list is a 0-indexed list containing all nodes of the graph. It is
      # used to find a node from its value in O(n) time
      @graph_list = Array.new(n_nodes)

      # @graph_hash is a hash mapping a color_id (Integer), to all of the nodes
      # (Node) in the graph that have that color_id
      @graph_hash = {}

      # initializes the graph_list and graph_hash, and then we only need to
      # use @graph_list and @graph_hash to handle the graph
      initialize_graph
    end

    # Complexity (n: the number of nodes; m: the number of edges)
    # Time complexity: O(n x m)
    # Space complexity: O(n + m)
    #
    # How does it work?
    # At first, we initialize the graph by composing the attributes:
    # - @graph_list: a list indexing each node of the graph. This is used so
    #   that, given a value (id) of a node, we can find it in O(n)
    # - @graph_hash: a hash mapping a color_id to all the nodes that have that
    #   color. This is used so that, when searching for the nearest clone, we
    #   can access the relevant source nodes in O(n)
    #
    # Once we initialize the graph (by creating the nodes, connecting them
    # bi-directionally, and keeping the graph represtation state into
    # @graph_list and @graph_hash, all we need to do is to apply a BFS into
    # each of the nodes from the desired color_id and see which is the minimum
    # distance of each of those to a node with the same color.
    #
    # Also, some corner cases have been treated for performance gain:
    # - if there is no node with the desired color OR there is only one node
    #   with the desired color, we can return NO_PATH_CODE given that in these
    #   contexts, there will be no possible path
    #
    # color_id: Integer. The color_id from which smallest path we want to find
    def find_nearest_clone(color_id)
      color_nodes = @graph_hash[color_id]
      return NO_PATH_CODE if color_nodes.nil? || color_nodes.length == 1

      min_distance = Float::INFINITY
      color_nodes.each do |node|
        distance = shortest_distance_from(node, color_id)
        is_smallest = distance != NO_PATH_CODE && distance < min_distance
        min_distance = distance if is_smallest
      end
      min_distance
    end

    private

    # This method converts a 1-indexed represented array into a 0-indexed one
    # Example: [1, 2, 5, 4] => [0, 1, 4, 3]
    #
    # This is done to simplify the ids handling
    #
    # return: Array<Integer>
    def to_zero_indexed(array)
      array.each_with_index { |number, index| array[index] = number - 1 }
    end

    # This method initializes the attributes @graph_list and @graph_hash, that
    # represent the graph state
    #
    # returns void
    def initialize_graph
      @color_ids.each_with_index do |color_id, index|
        create_node_into_graph(index, color_id)
      end
      connect_nodes
    end

    # Creates the node with the value and color_id and adds it to the graph
    #
    # return: void
    def create_node_into_graph(index, color_id)
      node = Node.new(index, color_id)
      @graph_list[index] = node
      @graph_hash[color_id] ||= []
      @graph_hash[color_id] << node
    end

    # Iterates over the edges (@graph_from and @graph_to) and connect the
    # nodes in bi-directional edges
    #
    # return: void
    def connect_nodes
      (0..@graph_from.length - 1).each do |index|
        node_from = @graph_list[@graph_from[index]]
        node_to = @graph_list[@graph_to[index]]

        # corner case: avoid connection between the node to itself
        next if node_from == node_to

        # connect nodes in both ways
        node_from.add_node(node_to)
        node_to.add_node(node_from)
      end
    end

    # Finds the the smallest distance between the current node and another node
    # of the color_id
    #
    # return: Integer.
    def shortest_distance_from(node, color_id)
      # visited_nodes keeps a record of nodes that have been already added to
      # the Queue used to implement the BFS
      visited_nodes = Set.new # Set<Integer>

      # Initializes next_nodes_to_search with the children nodes of the current
      # node, and add each of those to the visited_nodes set
      next_nodes_to_search = node.nodes.map(&:value) # array (Queue)
      next_nodes_to_search.each { |node_value| visited_nodes.add(node_value) }

      distance = 0

      # Iterate over next_nodes_to_search Queue until it gets empty
      until next_nodes_to_search.empty?
        distance += 1
        # remove first element of the Queue
        current_node = @graph_list[next_nodes_to_search.shift]
        return distance if current_node.color_id == color_id

        visited_nodes.add(current_node.value)

        fill_next_nodes_queue(current_node, next_nodes_to_search, visited_nodes)
      end
      NO_PATH_CODE
    end

    # Updates the variable next_nodes_to_search adding the children of the
    # current node
    #
    # return: void
    def fill_next_nodes_queue(node, next_nodes_to_search, visited_nodes)
      node.nodes.each do |child|
        next if visited_nodes.include?(child.value)

        next_nodes_to_search << child.value
      end
    end
  end
end
