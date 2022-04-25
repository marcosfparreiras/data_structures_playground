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
      @occurrences = {} # holds a counter of occurrences for each number
      @pair_occurrences = {} # holds a counter of occurrences for the final pair of the triplet
      @triplets_counter = 0
    end

    def count
      @list.reverse.each do |number|
        next_number_progression_number = number * @ratio

        update_pair_occurrences(number, next_number_progression_number)
        update_counter(number, next_number_progression_number)
        update_occurences(number, next_number_progression_number)

        puts
        puts '-----------------------------'
        puts "number: #{number}; next_number: #{next_number_progression_number}"
        puts 'occurrences:'
        p @occurrences

        puts 'pair_occurrences:'
        p @pair_occurrences

        puts "triplets_counter: #{@triplets_counter}"
      end
      @triplets_counter
    end

    private

    def update_occurences(number, next_number)
      @occurrences[number] ||= 0
      @occurrences[number] += 1

      @occurrences[next_number] ||= 0
    end

    def update_pair_occurrences(number, next_number)
      @occurrences[next_number] ||= 0
      @pair_occurrences[next_number] ||= 0

      @pair_occurrences[number] ||= 0
      @pair_occurrences[number] += @occurrences[next_number]
    end

    def update_counter(number, next_number)
      @triplets_counter += @pair_occurrences[next_number]
    end
  end
end
