# frozen_string_literal: true

module HackerRank
  # This class implements the solution to the NewYearChaos problem from
  # Hacker Rank.
  #
  # The link for the problem in HackerRank is the following:
  # https://www.hackerrank.com/challenges/new-year-chaos/problem
  class NewYearChaos
    TOO_CHAOTIC_STRING = 'Too chaotic'
    MAX_POSITIONS_ADVANCE = 2

    # final_positions: Array<Integer>: a shuffled 1-indexed array representing
    #   the final position of each person in the line
    def initialize(final_positions)
      # process the aray to have it as a 0-indexed array for simplicity
      @final_positions = final_positions.map { |number| number - 1 }
    end

    # Complexity (for n being the size of the array of positions)
    # Time complexity: O(n^2) in worst case
    # Space complexity: O(1)
    #
    # How does it work:
    # In order to count how many bribes happened, all we need is to count how
    # many bribers bribed each person on the line. We can achieve that by
    # counting, for each position, how many people with higher number are in
    # front of this person in the line.
    # The key points to keep in mind are:
    # - any person can go back in the line an unlimited number of positions
    #   until the last position of the line
    #
    # - any person can go maximum 2 positions in front of its initial position.
    #   (each position you move to the front, means one bribe, and no one can
    #   get to more than 2 bribes)
    #
    def mininum_bribes
      total_bribes = 0

      (@final_positions.length - 1).downto(0).each do |index|
        initial_index = @final_positions[index]
        position_advance = initial_index - index
        return TOO_CHAOTIC_STRING if position_advance > MAX_POSITIONS_ADVANCE

        total_bribes += count_bribers_of_position(index)
      end
      total_bribes
    end

    private

    # In order to count how many people bribed the current person, we only need
    # to take into account:
    # - people who are in front of the current person and have higher number
    #   (that means that someone who was behind this person, at some point
    #   bribed it)
    # - also, we only need to analyze people who are in a position of the line
    #   from one position before the original position of the current person.
    #   This is guaranteed because anyone who started behind the this person can
    #   only bribe two people. So the first bribe would take this person's place
    #   and the second bribe would put him/her right in front of the person's
    #   original position
    #
    # With that, for each person, we only have to analyze people:
    # - who are from his initial position - 1 until his current position -1
    #
    # As an example, when analizing the final position [0, 1, 2, 4, 5, 6, 7, 3],
    # and taking the example of the person 3 (in the last place of the line):
    # - it started on position 2, and it is now on postion 7
    # - in order to see who went in front of it, we only need to analyze people
    #   from positions 2 (3 - 1) until 6 (3 - 1)
    #
    # This idea of the starting point from the initial position - 1 is a huge
    # step in performance
    def count_bribers_of_position(index)
      bribers = 0
      start_search_index = [0, @final_positions[index] - 1].max
      start_search_index.upto(index - 1).each do |antecessor_index|
        bribers += 1 if @final_positions[antecessor_index] > @final_positions[index]
      end
      bribers
    end
  end
end
