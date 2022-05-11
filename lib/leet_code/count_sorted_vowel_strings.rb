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
