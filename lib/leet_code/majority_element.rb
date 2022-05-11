# frozen_string_literal: true

module LeetCode
  # Implements the solution for the problem Majority Element, from LeetCode
  #
  # The link for the problem in LeetCode is the following:
  # https://leetcode.com/problems/majority-element/
  #
  # The link for the submissions can be found at:
  # https://leetcode.com/submissions/detail/697580939/ (Space Complexity O(n))
  # https://leetcode.com/submissions/detail/697592013/ (Space Complexity O(n))
  class MajorityElement
    def initialize(nums)
      @nums = nums
    end

    # There are two different implementations for the problem, both having
    # time complexity O(n), but one with space complexity O(n) and another one
    # space complexity O(1)
    def find
      find_space_o_1
    end

    # Time complexity: O(n)
    # Space complexity: O(n)
    #
    # How does it work?
    # Simply iterate over the array and keep a counter of how many times each
    # number occurs. As soon as a number reaches over length / 2, this is for
    # sure the majority, and we return this value
    #
    # return Integer
    def find_space_o_n
      numbers_counter = {}

      @nums.each do |num|
        numbers_counter[num] ||= 0
        numbers_counter[num] += 1

        return num if numbers_counter[num] > @nums.length / 2
      end
    end

    # Time complexity: O(n)
    # Space complexity: O(1)
    #
    # How does it work?
    # It iterates over the array and keep two control variables:
    # - major: the current candidate to be the number that occurs over lenght/2
    #          times
    # - count: the balance towards the current major candidate.
    #
    # The idea is the following:
    # - if the number is equal to the major, we incrase the count
    # - if the number is different than the major, we decrease the count
    # - if the count gets to 0, the new number becomes the major and the count
    #   is set to 1.
    #
    # This works because for sure there will be one number that occurs more than
    # all the other ones combined, so this one will be set as major at some
    # point when the count can not get be set to zero again.
    #
    # return Integer
    def find_space_o1
      major = @nums[0]
      count = 1

      (1..@nums.length - 1).each do |index|
        major = @nums[index] if count == 0

        if @nums[index] == major
          count += 1
        else
          count -= 1
        end
      end
      major
    end
  end
end

# # This is how we need to run it on LeetCode
# # @param {Integer[]} nums
# # @return {Integer}
# def majority_element(nums)
#   LeetCode::MajorityElement.new(nums).find
# end
