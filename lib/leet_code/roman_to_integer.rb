# frozen_string_literal: true

module LeetCode
  # Implements the solution for the problem Network Delay Time, from LeetCode
  #
  # The link for the problem in LeetCode is the following:
  # link: https://leetcode.com/problems/roman-to-integer/
  #
  # The link for the submission is:
  # https://leetcode.com/submissions/detail/700121606/
  class RomanToInteger
    MAP = {
      'I' => 1,
      'V' => 5,
      'X' => 10,
      'L' => 50,
      'C' => 100,
      'D' => 500,
      'M' => 1000
    }.freeze

    # Complexity:
    #   - Time complexity: O(n)
    #   - Space complexity: O(1)
    #
    # How does it work?
    # We iterate over each character in the roman number. We then map this
    # character to its integer value. If there is a next value after this one,
    # we check if it's greater than the current one. If it is smaller or equal,
    # we simply add the current value to the accumulator. If the next value is
    # greater than the current one, we are than in special cases, in which we
    # have to subtract the accumulator from the current number.
    #
    # As an example, the number XIV (14), would do the following, the integer
    # number would be composed by: 10 - 1 + 4
    #
    # Note on time complexity: O(n) is the best possible time complexity for the
    # problem, given that we have to go through all the characters of the string
    # to build the total value.
    #
    # roman_num: String
    # returns Integer
    def self.convert(roman_num)
      return 0 if roman_num.nil?

      num = 0
      (0..roman_num.length - 1).each do |index|
        current_value = int_value(roman_num[index])

        if index + 1 < roman_num.length
          next_value = int_value(roman_num[index + 1])
          num += next_value > current_value ? -current_value : current_value
        else
          num += current_value
        end
      end
      num
    end

    # char: Character
    # returns Integer
    def self.int_value(char)
      MAP[char]
    end
  end
end

# # This is needed to run on LeetCode
# # @param {String} s
# # @return {Integer}
# def roman_to_int(s)
#   LeetCode::RomanToInteger.convert(s)
# end
