
module HackerRank
  # Link: https://www.hackerrank.com/challenges/ctci-bfs-shortest-reach/problem
  # Note: not passing all cases in HackerRank
  class ShortestReach
    class Node
      attr_accessor :value, :nodes
      def initialize(value)
        @value = value
        @nodes = []
      end

      def add_node(node)
        @nodes << node
      end
    end

    class Graph
      attr_reader :size, :nodes

      def initialize(size, edges)
        @size = size
        @nodes = create_nodes(size, edges)
      end

      def create_nodes(size, edges)
        nodes = 0.upto(size - 1).map { |index| Node.new(index) }

        edges.each do |edge|
          index_from = edge[0] - 1
          index_to = edge[1] - 1

          nodes[index_from].add_node(nodes[index_to])
          nodes[index_to].add_node(nodes[index_from])
        end
        nodes
      end

      def get_node(index)
        @nodes[index]
      end
    end

    EDGE_LENGTH = 6

    # size: Integer. The number of nodes in the graph
    # edges: Array<Array<Integer>>. The edges between the nodes with node ids
    #        represented in 1-indexed.
    def initialize(size, edges)
      @graph = Graph.new(size, edges)
    end


    # Finds the shortest path from the start node to all the other nodes
    #
    # start_node: Integer. The start node index (considering 1-indexed id)
    # returns: Array<Integer>
    def find_shortest_reach_from(start_node_index)
      start_node_index = start_node_index - 1 # transforms to 0-indexed reference
      # initializes the distance array with -1 to all nodes
      distances = Array.new(@graph.size) { -1 }
      distances[start_node_index] = 0

      visited_nodes = Array.new(@graph.size) { false }
      visited_nodes[start_node_index] = true
      # array of arrays in format [ditance_to_parent, node]
      next_nodes_to_visit = @graph.get_node(start_node_index).nodes.map do |child|
          [0, child.value]
      end

      while !next_nodes_to_visit.empty?
        current_record = next_nodes_to_visit.shift
        distance_to_parent = current_record[0]
        current_node_index = current_record[1]

        total_distance = distance_to_parent + EDGE_LENGTH
        distances[current_node_index] = total_distance
        visited_nodes[current_node_index] = true

        @graph.get_node(current_node_index).nodes.each do |child|
          next if visited_nodes[child.value]
          next_nodes_to_visit << [total_distance, child.value]
        end
      end
      distances.delete_at(start_node_index)
      distances
    end
  end
end


## This lines are needed also in HackerRank text editor in order to run the code
num_queries = gets.strip.to_i
num_queries.times do
  edges = []
  num_nodes, num_edges = gets.strip.split(' ').map(&:to_i)
  num_edges.times do
    new_edge = gets.strip.split(' ').map(&:to_i)
    edges << new_edge
  end
  start_index = gets.strip.to_i
  result =  HackerRank::ShortestReach.new(num_nodes, edges).find_shortest_reach_from(start_index)
  puts result.join(' ')
end
