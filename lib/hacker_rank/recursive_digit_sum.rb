# frozen_string_literal: true

module HackerRank
  # This class implements the solution to the RecursiveDigitSum problem from
  # Hacker Rank.
  #
  # The link for the problem in HackerRank is the following:
  # https://www.hackerrank.com/challenges/recursive-digit-sum/problem
  class RecursiveDigitSum
    # string_number: String
    # repetition_times: Integer
    def initialize(string_number, repetition_times)
      @string_number = string_number
      @repetition_times = repetition_times
    end

    # Complexity (n: number of chars in the string)
    # Runtime: O(n)
    # Space complexity: O(n)
    #
    # How does it work?
    # The idea is to get the super digit for the string_number itself, and we
    # do it by getting the sum of all of its digits, and call the method
    # recursively with that sum (as string), until we get to one single digit.
    #
    # After that, we simply calculate the super digit from the value got
    # multiplied by the repetition_times (the mathematical property ensures
    # that this will work for any case)
    #
    # returns Integer
    def super_digit
      number_superdigit = super_digit_recursive(@string_number)

      super_digit_recursive((number_superdigit * @repetition_times).to_s)
    end

    # number: String
    # returns: Integer
    def super_digit_recursive(number)
      return number.to_i if number.size == 1

      sum = 0
      number.each_char do |char|
        sum += char.to_i
      end

      super_digit_recursive(sum.to_s)
    end
  end
end
