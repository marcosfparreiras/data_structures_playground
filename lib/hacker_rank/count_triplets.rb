# frozen_string_literal: true

module HackerRank
  # This class implements the solution to the Count Triplets problem from
  # Hacker Rank, in which one must count the number of triplets (i, j, k) such
  # that i < j < k and those indices are in geometric progression for a given
  # common ratio
  #
  # The link for the problem in HackerRank is the following:
  # https://www.hackerrank.com/challenges/count-triplets-1/problem
  class CountTriplets
    # list: Array<Integer>
    # ratio: Integer
    def initialize(list, ratio)
      @list = list
      @ratio = ratio
      # holds a counter of occurrences for each number
      @occurrences = {}
      # holds a counter of occurrences for the final pair of the triplet
      @pair_occurrences = {}
      @triplets_counter = 0
    end

    # Complexity (n: size of the list)
    # Runtime: O(n)
    # Space complexity: O(n)
    #
    # How does it work?
    # The idea is to iterate the list backwards, and for each item, identify how
    # many occurrences there are for the remaining 2 items in the triplet. In
    # order to do it, we have to keep track of how many times a number appears
    # and also how many times the two missing 2 numbers appear (in order, such
    # that condition triple (i, j, k), being i < j < k the indexes in the list
    # is satisfied.
    #
    #
    # Example:
    #   list: [1, 2, 2, 4, 8]
    #   ratio: 2
    #
    # We first get the last item (8), and check how many times the two
    # missing numbers (16, 32) appear in this order. There are 0 occurencies,
    # so the counter stays in 0.
    #
    # We then get the next number (4). There are no occurrences of (8, 16) up
    # to this point, so the counter stays in 0.
    #
    # We then get the 2. There is one ocurrency of (4, 8), so the counter is
    # increased by 1
    #
    # We then get the other 2. There is one occurency of (4, 8), so the counter
    # is increased by 1, again.
    #
    # Finally, we get the number 1. There are two occurnencies of (2, 4), so
    # the counter is increased by 2.
    #
    # At the end, we have 4 triplets
    #
    #
    # In order to do that, we use two hashes:
    # - one to keep track of how many times the remaining two numbers appeared
    #   (pair_occurrences)
    # - one to keep track of how many times a number appeared
    #   (occurrences)
    def count
      @list.reverse.each do |number|
        next_number_progression_number = number * @ratio

        prepare_hashes(number, next_number_progression_number)
        update_counter(next_number_progression_number)

        update_pair_occurrences(number, next_number_progression_number)
        update_occurences(number)
      end
      @triplets_counter
    end

    private

    def prepare_hashes(number, next_number)
      @occurrences[number] ||= 0
      @occurrences[next_number] ||= 0

      @pair_occurrences[number] ||= 0
      @pair_occurrences[next_number] ||= 0
    end

    def update_counter(next_number)
      @triplets_counter += @pair_occurrences[next_number]
    end

    def update_pair_occurrences(number, next_number)
      @pair_occurrences[number] += @occurrences[next_number]
    end

    def update_occurences(number)
      @occurrences[number] += 1
    end
  end
end
