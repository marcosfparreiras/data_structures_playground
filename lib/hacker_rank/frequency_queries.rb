# frozen_string_literal: true

module HackerRank
  # This class implements the solution to the NewYearChaos problem from
  # Hacker Rank.
  #
  # The link for the problem in HackerRank is the following:
  # https://www.hackerrank.com/challenges/frequency-queries/problem
  class FrequencyQueries
    def initialize(queries)
      @queries = queries
      @numbes_frequencies = {}
      @count_frequencies = {}
    end

    # Complexity (n being the number of arrays in the queries)
    # Time complexity: O(n)
    # Space complexity: O(n)
    #
    # How does it work?
    # The idea is to structure the solution in a way that all the operations
    # add, remove and check are O(1), so that the overal complexity of the
    # algorithm is O(n).
    #
    # We achieve this performance by keeping the data distributed into two
    # different hashes:
    # - numbes_frequencies: keeps the count of how many times a given number
    #   appeared
    #
    # - count_frequencies: keeps the count of how many times a given frequency
    #   of occurrences appeared
    #
    def run
      frequencies = []
      @queries.each do |query|
        operation = query[0]
        number = query[1]

        case operation
        when 1
          add_element(number)
        when 2
          remove_element(number)
        when 3
          frequencies << frequency_check(number)
        end
      end
      frequencies
    end

    private

    # Adding (time complexity: O(1), space complexity: O(1))
    # when we add an element, all we have to do is increment the occurrences of
    # this number at @numbes_frequencies, and then we update the hash
    # @count_frequencies, by decreasing by one the occurences of the current
    # frequency and increasing by one the frequency + 1 ()
    #
    # number: Integer
    def add_element(number)
      frequency = @numbes_frequencies[number].to_i

      @numbes_frequencies[number] = frequency + 1
      update_count_frequencies(frequency, frequency + 1)
    end

    # Removing (time complexity: O(1), space complexity: O(1))
    # when we remove an element, all we have to do is:
    #   if number does not have any occurrence, we don't do anything
    #
    #   otherwise, we decrease its record at @numbes_frequencies, decrease the
    #   frequency in @count_frequencies and increase the frequency - 1 in
    #   @count_frequencies (if the new frequency is not zero)
    #
    # number: Integer
    def remove_element(number)
      frequency = @numbes_frequencies[number].to_i

      return unless frequency > 0

      @numbes_frequencies[number] = frequency - 1
      update_count_frequencies(frequency, frequency - 1)
    end

    # This is a helper method to update the count frequencies, and it's used
    # to increment/decrement the frequencies at @count_frequencies
    def update_count_frequencies(previous_frequency, new_frequency)
      @count_frequencies[previous_frequency] -= 1 if @count_frequencies[previous_frequency].to_i > 0

      return if new_frequency == 0

      @count_frequencies[new_frequency] ||= 0
      @count_frequencies[new_frequency] += 1
    end

    # Checking a frequency (time complexity: O(1), space complexity: O(1))
    # This method checks against @count_frequencies if there is any number with
    # the 'frequency' number of occurrences. In case frequency is 0, we also
    # return 1 (there are infinity numbers with 0 occurences)
    #
    # frequency: Integer
    # returns Integer
    def frequency_check(frequency)
      check = frequency == 0 || @count_frequencies[frequency].to_i > 0
      check ? 1 : 0
    end
  end
end
