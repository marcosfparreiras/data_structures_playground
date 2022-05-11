# frozen_string_literal: true

module LeetCode
  # Implements the solution for the problem CombinationSum3, from LeetCode
  #
  # The link for the problem in LeetCode is the following:
  # https://leetcode.com/problems/combination-sum-iii
  #
  # The link for the submissions can be found at:
  # https://leetcode.com/submissions/detail/696753667/
  class CombinationSum3
    def initialize(num_numbers, sum)
      @num_numbers = num_numbers
      @sum = sum
    end

    # Complexity (n: num_numbers)
    # Time complexity: O(n!)
    # Space complexity: O(n)
    #
    # How does it work?
    # It forms all possible combinations of num_numbers, as long as there is
    # a chance that going forward the sum will be achieved. This is done
    # recursively. We bubble down the valid combinations found, and once a new
    # combination is found, we add it to the variable
    #
    # return Array<Array<Integer>>
    def find_solution
      min_sum_possible = (1..@num_numbers).to_a.inject(:+)
      max_sum_possible = ((9 - @num_numbers + 1)..9).to_a.inject(:+)

      # treat edge case: if sum is greater than maximum possible value or
      # smaller than mininum sum possble returns empty array
      return [] if @sum > max_sum_possible || @sum < min_sum_possible

      # treat edge case: if sum is equal the maximum possible value, returns
      # the combination of values for that
      return [((9 - @num_numbers + 1)..9).to_a] if @sum == max_sum_possible

      valid_combinations = Set.new
      get_combinations([], valid_combinations)

      # converts the set into Array
      valid_combinations.to_a
    end

    private

    # return Set<Array<Integer>>
    def get_combinations(numbers, valid_combinations)
      numbers_sum = numbers.reduce(:+).to_i
      return valid_combinations if numbers_sum > @sum

      if numbers.size == @num_numbers
        is_valid = numbers_sum == @sum
        valid_combinations.add(numbers) if is_valid
        return valid_combinations
      end

      generate_children_calls(numbers, valid_combinations)
    end

    # return Set<Array<Integer>>
    def generate_children_calls(numbers, valid_combinations)
      numbers_sum = numbers.reduce(:+).to_i

      # start value is first number after the biggest one so far
      start_value = numbers.last.to_i + 1
      # final value is eithar 9 or the remaining value for the sum
      final_value = [9, @sum - numbers_sum].min

      (start_value..final_value).each do |num|
        next_numbers = numbers.dup.append(num)
        get_combinations(next_numbers, valid_combinations)
      end
    end
  end
end

# # This is how we need to run it on LeetCode
# #
# # @param {Integer} k
# # @param {Integer} n
# # @return {Integer[][]}
# def combination_sum3(k, n)
#   LeetCode::CombinationSum3.new(k, n).find_solution
# end
