# frozen_string_literal: true

module LeetCode
  # Implements the solution for the problem Network Delay Time, from LeetCode
  #
  # The link for the problem in LeetCode is the following:
  # link: https://leetcode.com/problems/network-delay-time/
  #
  # The link for the submission is:
  # https://leetcode.com/submissions/detail/699293332/
  class NetworkDelayTime
    # times: Array<Integer>: Triplet with node_from, node_to and time.
    #                        the nodes are identified in 1-indexed format
    # num_nodes: the number of nodes
    def initialize(times, num_nodes)
      @num_nodes = num_nodes
      @adj_matrix = build_matrix(times, num_nodes)
    end

    # Complexity: (n being the number of nodes)
    # Time complexity: O(n^2)
    # Space complexity: O(n)
    #
    # How does it work?
    # As we want to see the total time to reach all the nodes, what we need to
    # do is actuallly find the time from the initial node to all the other nodes
    # and the total time will be simply the greater value to reach any node.
    # In order to solver this problem, we can apply Dijkstra's Algorithm, which
    # consists of:
    # - we use two auxiliar components:
    #   - a set with n positions containing the unvisited nodes
    #   - an array with n positions containing the time from start node to
    #     any node
    # - we pick the node with minimum time (at the beginning, the time
    #   array is initialized with 0 to start node and infinity to all others)
    # - we remove this element from the unvisited nodes
    # - we get all its neighbours that haven't been visited yet, and we check
    #   the time to them from the source node, which can be simply found by
    #   time to source node + time from source to next node. If this
    #   time is smaller than the time to reach the next node, we then
    #   update its value with the new calculated value.
    # - we repeat these steps until we have visited all the nodes
    #
    # - at the end, the time_to_nodes array will have the mininum time
    #   from the initial node to any other node.
    # - we then just need to pick the maximum value of this array. If some
    #   entry still have value Infinity, it means that there is no path from
    #   start node to this node.
    #
    #
    # returns Integer: the total transmission delay time. This can also be seen
    #                  as the greatest time from initial node to any other
    #                  node
    def find_total_transmission_delay(initial_node)
      initial_node -= 1 # to 0-indexed value
      unvisited_nodes = Set.new((0..@num_nodes - 1).to_a)
      time_to_nodes = Array.new(@num_nodes) { Float::INFINITY }
      time_to_nodes[initial_node] = 0

      until unvisited_nodes.empty?
        node = pick_next_node(unvisited_nodes, time_to_nodes)
        break if node.nil?

        unvisited_nodes.delete(node)
        # process_current_node(node)
        process_current_node(node, time_to_nodes, unvisited_nodes)

        # @adj_matrix[node].each_index do |next_node|
        #   time = @adj_matrix[node][next_node]
        #   next if time.nil?

        #   time_to_next_node = time_to_nodes[node] + time
        #   if time_to_next_node < time_to_nodes[next_node]
        #     time_to_nodes[next_node] = time_to_next_node
        #   end
        # end
      end

      max_time = time_to_nodes.max
      max_time == Float::INFINITY ? -1 : max_time
    end

    private

    def build_matrix(times, num_nodes)
      adj_matrix = Array.new(num_nodes) { Array.new(num_nodes) { nil } }

      times.each do |time_triplet|
        from = time_triplet[0] - 1 # from 1-indexed to 0-indexed
        to = time_triplet[1] - 1   # from 1-indexed to 0-indexed
        time = time_triplet[2]

        adj_matrix[from][to] = time
      end
      adj_matrix
    end

    def pick_next_node(unvisited_nodes, time_to_nodes)
      min_time = Float::INFINITY
      min_time_index = nil
      unvisited_nodes.each do |index|
        if time_to_nodes[index] < min_time
          min_time_index = index
          min_time = time_to_nodes[index]
        end
      end

      min_time_index
    end

    def process_current_node(node, time_to_nodes, unvisited_nodes)
      @adj_matrix[node].each_index do |next_node|
        time = @adj_matrix[node][next_node]
        # we don't process the next node if there is no connection to that
        # node or if that node has been already visited
        next if time.nil? || !unvisited_nodes.include?(next_node)

        time_to_next_node = time_to_nodes[node] + time
        time_to_nodes[next_node] = [
          time_to_nodes[next_node],
          time_to_next_node
        ].min
      end
    end
  end
end

# # This code is what is needed to run the code on LeetCode
# # @param {Integer[][]} times
# # @param {Integer} n
# # @param {Integer} k
# # @return {Integer}
# def network_delay_time(times, n, k)
#   LeetCode::NetworkDelayTime.new(times, n).find_total_transmission_delay(k)
# end
