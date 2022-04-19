# frozen_string_literal: true

module HackerRank
  # This class implements the solution to the Count Triplets problem from
  # Hacker Rank, in which one must count the number of triplets (i, j, k) such
  # that i < j < k and those indices are in geometric progression for a given
  # common ratio
  #
  # The link for the problem in HackerRank is the following:
  # https://www.hackerrank.com/challenges/minimum-swaps-2/problem
  class CountTriplets
    # list: Array<Integer>
    # ratio: Integer
    def initialize(list, ratio)
      @list = list
      @ratio = ratio
    end

    def count
      hash = build_ocurrencies_count_hash
      count_geometric_progression_permutations(hash)
    end

    private

    def build_ocurrencies_count_hash
      hash = {}
      @list.each do |integer|
        hash[integer] ||= 0
        hash[integer] = hash[integer] + 1
      end
      hash
    end

    def count_geometric_progression_permutations(hash)
      numbers_order = hash.keys.sort
      count = 0
      numbers_order.each do |number|
        next if hash[number * @ratio].nil? || hash[number * @ratio * @ratio].nil?
        count += hash[number] * hash[number * @ratio] * hash[number * @ratio * @ratio]
      end
      count
    end
  end
end
