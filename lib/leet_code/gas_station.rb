# frozen_string_literal: true

module LeetCode
  # Implements the solution for the problem CombinationSum3, from LeetCode
  #
  # The link for the problem in LeetCode is the following:
  # https://leetcode.com/problems/gas-station/
  #
  # The link for the submissions can be found at:
  # https://leetcode.com/submissions/detail/697333454/
  class GasStation
    NO_VALID_RESPONSE = -1

    # gas: Array<Integer>. How much gas the car can fill in each index
    # cost: Array<integer>. The cost in gas from each index to get to the next
    #                       one
    def initialize(gas, cost)
      @gas = gas
      @cost = cost
    end

    # Finds the smallest index from which the car should start in order to
    # complete the cycle
    #
    # Complexity (n: the number of gas stations, i.e. length of gas and cost)
    # Time Complexity: O(n)
    # Space Complecity: O(1)
    #
    # How does it work?
    # We iterate over each index of the arrays gas and cost, starting from the
    # initial index, and we keep track of three variables:
    # - start_index: the last valid start index
    # - debt: the total debt accumulated from index 0 until the current
    # - tank: the total debt accumulated from the last valid start index
    #
    # At any point, if the tank gets negative, it means that the car does not
    # get to the next station, so we set the new start_index to the next index
    #
    # At the end, we see that the car can complete the circuit if:
    # - the tank is not negative
    # - the debt is not negative
    # - start_index is a valid idex in the gas and cost arrays
    # - the ammount of gas in the initial station is greater tha 0
    #
    # return Integer
    def find_smallest_index
      tank = 0
      debt = 0
      start_index = 0

      @gas.each_index do |index|
        station_debt = @gas[index] - @cost[index]
        tank += station_debt
        debt += station_debt
        if tank < 0
          start_index = index + 1
          tank = 0
        end
      end

      return start_index if valid_response?(tank, debt, start_index)

      NO_VALID_RESPONSE
    end

    private

    def valid_response?(tank, debt, start_index)
      tank >= 0 &&
        debt >= 0 &&
        start_index < @gas.length &&
        @gas[start_index] > 0
    end
  end
end

# # This is how we need to run it on LeetCode
# # @param {Integer[]} gas
# # @param {Integer[]} cost
# # @return {Integer}
# def can_complete_circuit(gas, cost)
#   GasStation.new(gas, cost).find_smallest_index
# end
