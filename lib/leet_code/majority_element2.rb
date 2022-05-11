# frozen_string_literal: true

module LeetCode
  # Implements the solution for the problem Majority Element II, from LeetCode
  #
  # The link for the problem in LeetCode is the following:
  # https://leetcode.com/problems/majority-element-ii/
  #
  # The link for the submissions can be found at:
  # https://leetcode.com/submissions/detail/697687661/ (Space Complexity O(n))
  # https://leetcode.com/submissions/detail/697692426/ (Space Complexity O(1))
  class MajorityElement2
    def initialize(nums)
      @nums = nums
    end

    # Time complexity: O(n)
    # Space complexity: O(1)
    #
    # How does it work?
    # It iterates over the array and keep four control variables:
    # - major1 and major2: the two current candidate to be the number that
    #                      occurs over lenght/2 times
    # - count1 and count2: the balance towards the current major candidates.
    #
    # The idea is the following:
    # - if the number is equal to the major, we incrase the count
    # - if the number is different than the major, we decrease the count
    # - if the count gets to 0, the new number becomes the major and the count
    #   is set to 1.
    #
    # This works because for sure there will be only one or two numbers that
    # occur more than n/3 times. At the end, we will have on major1 and major2
    # the two most common numbers in the array. However, we still have to
    # iterate over the array again to ensure that both numbers happen over n/3
    # times
    #
    # return Integer
    # returns Array<Integer>
    def find_space_o1
      major1 = major2 = nil
      count1 = count2 = 0

      @nums.each do |num|
        if num == major1
          count1 += 1
        elsif num == major2
          count2 += 1
        elsif count1 == 0
          major1 = num
          count1 = 1
        elsif count2 == 0
          major2 = num
          count2 = 1
        else
          count1 -= 1
          count2 -= 1
        end
      end

      collect_majors(major1, major2)
    end

    # helper method for find_space_o1
    def collect_majors(major1, major2)
      total_major1 = @nums.count { |n| n == major1 }
      total_major2 = @nums.count { |n| n == major2 }

      arr = []
      arr << major1 if total_major1 > @nums.length / 3
      arr << major2 if total_major2 > @nums.length / 3

      arr.sort
    end

    # Time complexity: O(n)
    # Space complexity: O(n)
    #
    # How does it work?
    # Simply iterate over the array and keep a counter of how many times each
    # number occurs. As soon as a number reaches over length / 3, we add this
    # element to the set to be returned
    #
    # return Array<Integer>
    def find_space_o_n
      hsh = {}
      major_nums = Set.new
      limit = @nums.length / 3

      @nums.each do |num|
        hsh[num] ||= 0
        hsh[num] += 1

        major_nums.add(num) if hsh[num] > limit
      end

      major_nums.to_a.sort
    end
  end
end

# # # This is how we need to run it on LeetCode
# # @param {Integer[]} nums
# # @return {Integer[]}
# def majority_element(nums)
#   LeetCode::MajorityElement2.new(nums).find
# end
