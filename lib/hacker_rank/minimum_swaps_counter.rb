# frozen_string_literal: true

module HackerRank
  # This class implements the logic to count the minimum number of swaps needed
  # to sort a unordered array consisting of consecutive numbers
  #
  # The link for the problem in HackerRank is the following:
  # https://www.hackerrank.com/challenges/minimum-swaps-2/problem
  class MinimumSwapsCounter
    def initialize(arr)
      @arr = arr
    end

    def count
      counter = 0
      index = 0
      while index < @arr.length
        if in_wrong_position?(index)
          swap_to_right_position(index)
          counter += 1
        else
          index += 1
        end
      end

      counter
    end

    private

    def in_wrong_position?(index)
      @arr[index] != index + 1
    end

    def swap_to_right_position(index)
      index_element = @arr[index]
      expected_position = index_element - 1

      @arr[index] = @arr[expected_position]
      @arr[expected_position] = index_element
    end
  end
end
