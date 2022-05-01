# frozen_string_literal: true

module HackerRank
  # This class implements the solution to the SherlockAndAnagrams problem from
  # Hacker Rank.
  #
  # Problem:
  # Two strings are anagrams of each other if the letters of one string can be
  # rearranged to form the other string. Given a string, find the number of
  # pairs of substrings of the string that are anagrams of each other.
  #
  # The link for the problem in HackerRank is the following:
  # https://www.hackerrank.com/challenges/sherlock-and-anagrams/problem
  class SherlockAndAnagrams
    def initialize(string)
      @string = string
      @substrings_count = {}
    end

    # Complexity (n: number of chars in the string)
    # Runtime: O(n^2)
    # Space complexity: O(n)
    #
    # How does it work?
    # The idea is to iterate over the string, and get all the substrings that
    # end with the current character. These substrings are stored in a hash
    # and then we calculate in how many ways the substrings can be arranged
    # 2 by 2 (n-choose-k, with k = 2)
    def find_anagrams_count
      count_substring_occurrences
      count_anagrams.to_i
    end

    private

    def count_substring_occurrences
      0.upto(@string.length - 1).each do |forward_index|
        (forward_index).downto(0).each do |backward_index|
          substring = @string[backward_index..forward_index]
          ordered_substring = sort_string(substring)

          increment_substring_count(ordered_substring)
        end
      end
    end

    def count_anagrams
      @substrings_count.each_value.inject(0) { |acc, value| acc + n_choose_k(value, 2) }
    end

    def n_choose_k(set_size, subset_size)
      factorial(set_size) / (factorial(subset_size) * factorial(set_size - subset_size))
    end

    def factorial(number)
      Math.gamma(number + 1)
    end

    def sort_string(string)
      string.chars.sort.join
    end

    def increment_substring_count(string)
      @substrings_count[string] ||= 0
      @substrings_count[string] += 1
    end
  end
end
