# frozen_string_literal: true

module LeetCode
  # Implements the solution for the problem Count Sorted Vowel Strings
  # from LeetCode
  #
  # The link for the problem in HackerRank is the following:
  # https://leetcode.com/problems/count-sorted-vowel-strings/
  #
  # The link for the submissions can be found at:
  # https://leetcode.com/submissions/detail/697566899/
  class CountSortedVowelStrings
    def initialize(num)
      @num = num
    end

    # Complexity (n being the number)
    # Time complexity: O(n) - we need (n - 2) * 5 operations
    # Space complexity: O(1)
    #
    # How does it work?
    # We solve the problem using Dynamic Programming, following the logic that
    # for every number n + 1, each letter will have the following number of
    # possible words:
    # - a: the sum of words starting from a, e, i, o, u
    # - e: the sum of words starting from e, i, o, u
    # - i: the sum of words starting from i, o, u
    # - o: the sum of words starting from o, u
    # - u: the sum of words starting from u
    #
    # We iterate 2 - num times, because the array arr in initialized considering
    # n = 1
    #
    # return Integer
    def count
      return 0 if @num == 0

      arr = [1, 1, 1, 1, 1]

      (2..@num).each do
        arr.each_index do |index|
          arr[index] = arr[index..-1].inject(:+)
        end
      end

      arr.reduce(:+)
    end
  end
end

# # This is how we need to run it on LeetCode
# # @param {Integer} n
# # @return {Integer}
# def count_vowel_strings(n)
#   LeetCode::CountSortedVowelStrings.new(n).count
# end
