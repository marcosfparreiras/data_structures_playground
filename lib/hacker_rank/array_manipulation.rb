# frozen_string_literal:true

module HackerRank
  # Implements the solution for the problem Array Manipulation, from HackerRank
  #
  # The link for the problem in HackerRank is the following:
  # https://www.hackerrank.com/challenges/crush/problem
  class ArrayManipulation
    def initialize(size, queries)
      @array = Array.new(size) { 0 }
      @queries = queries
    end

    # Complexity (n: size of array, m: number of queries)
    # Runtime: O(n)
    # Space complexity: O(n)
    #
    # How does it work?
    # The idea is to implement the solution with linear (O(n)) complexity. In
    # order to accomplish that, the intervals are seen the range where a summed
    # value is valid or not. As an example, in an array with 5 positions, the
    # entry "2 4 1" means to add 1 to all the elements between positions 2 and 5
    # (considering the 1-indexed arrays). After this operation, the array would
    # be:
    # [0, 1, 0, 0, -1]
    #
    # That menas that all items after position 2 (included) will have an
    # increase of 1. In order to apply the end of the interval, all the elements
    # after the position 4 get a decrese of 1.
    #
    # After all the queries are processed, we just need to see which is the
    # biggest accumulated value, and that will be largest value
    def process
      collect_change_intervals
      process_max_value
    end

    private

    def collect_change_intervals
      @queries.each do |params|
        index_to_add = params[0] - 1 # we add from the beginning of the interval
        index_to_substract = params[1] # # we subtract from the index after the closing interval
        value_to_add = params[2]

        @array[index_to_add] += value_to_add
        # we do not substract if the "to" element is the last one (out of range)
        @array[index_to_substract] -= value_to_add unless params[1] == @array.size
      end
    end

    def process_max_value
      max_value = 0
      @array.inject(0) do |sum, value|
        sum += value
        max_value = sum if sum > max_value
        sum
      end

      max_value
    end

    # NOTE: This code was left as documentation for the not optimal solution
    # # Complexity (n: size of array, m: number of queries)
    # # Runtime: O(n x m) in wrost case
    # # Space complexity: O(n)
    # #
    # # How does it work?
    # # It iterates over each query, and for each position in
    # # the array within the range, it adds the value
    # #
    # # This approach is extremely inefficient, given that it gets to runtime
    # # complexity of O(n x m)
    # def max_value_after_manipulation_greedy_implementation
    #   max_value = 0

    #   @queries.each do |params|
    #     start_index = params[0] - 1
    #     end_index = params[1] - 1
    #     value_to_add = params[2]

    #     (start_index..end_index).each do |index|
    #       new_value = @array[index] += value_to_add
    #       max_value = new_value if new_value > max_value
    #     end
    #   end
    #   max_value
    # end
  end
end
