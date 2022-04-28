# frozen_string_literal: true

module HackerRank
  # This class solves the problem Davis Staircase from HackerRank
  #
  # The link for the problem in HackerRank is the following:
  # https://www.hackerrank.com/challenges/ctci-recursive-staircase/problem
  class DavisStaircase
    MODULE_BY = (10**10) + 7

    def initialize(steps, steps_counter_class = StepsCounterDinamicProgramming)
      @steps_counter = steps_counter_class.new(steps)
    end

    def count
      @steps_counter.count % MODULE_BY
    end
  end

  # This class provides a base class for the different implementations of
  # StepsCounterBase
  class StepsCounterBase
    BASE_CONDITIONS = {
      0 => 0,
      1 => 1,
      2 => 2,
      3 => 4
    }.freeze

    def initialize(steps)
      @steps = steps
    end

    def count
      raise 'Must be overriden'
    end
  end

  # This class implements a solution for the staircase problem using recursion
  #
  # Time complexity: O(3^n)
  # Space complexity: O(3^n)
  class StepsCounterRecursive < StepsCounterBase
    def count
      count_ways(@steps)
    end

    private

    def count_ways(steps_missing)
      return BASE_CONDITIONS[steps_missing] if BASE_CONDITIONS.key?(steps_missing)

      count_ways(steps_missing - 1) + count_ways(steps_missing - 2) + count_ways(steps_missing - 3)
    end
  end

  # This class implements a solution for the staircase problem using recursion
  # and memoization, in order to increase its performance
  #
  # Time complexity: O(n)
  # Space complexity: O(n)
  class StepsCounterRecursiveMemoization < StepsCounterBase
    def count
      memo = Array.new(@steps + 1)
      count_ways(@steps, memo)
    end

    private

    def count_ways(steps_missing, memo)
      return BASE_CONDITIONS[steps_missing] if BASE_CONDITIONS.key?(steps_missing)

      steps_minus1 = fetch_value(memo, steps_missing - 1)
      steps_minus2 = fetch_value(memo, steps_missing - 2)
      steps_minus3 = fetch_value(memo, steps_missing - 3)

      steps_minus1 + steps_minus2 + steps_minus3
    end

    def fetch_value(memo, steps)
      return memo[steps] unless memo[steps].nil?

      count_ways(steps, memo)
    end
  end

  # This class implements a solution for the staircase problem using dynamic
  # programming in order to increase even more its performance
  #
  # Time complexity: O(n)
  # Space complexity: O(1)
  class StepsCounterDinamicProgramming < StepsCounterBase
    def count
      count_ways(@steps)
    end

    private

    def count_ways(steps)
      return BASE_CONDITIONS[steps] if BASE_CONDITIONS.key?(steps)

      ways = [1, 2, 4]

      # we start from 4 because if it's smaller than that, it will be covered
      # by the base cases
      4.upto(steps) do
        total_ways = ways[0] + ways[1] + ways[2]
        ways[0] = ways[1]
        ways[1] = ways[2]
        ways[2] = total_ways
      end

      ways[2]
    end
  end
end
