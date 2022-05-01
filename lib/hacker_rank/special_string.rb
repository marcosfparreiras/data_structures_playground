# frozen_string_literal:true

module HackerRank
  # This class is a helper class to organize how many times a character
  # appeared in a sequence
  class CharCount
    attr_accessor :char, :char_count

    def initialize(char = nil)
      @char = char
      @char_count = 0
    end
  end

  # This class implements the solution to the Special Strings problem from
  # Hacker Rank.
  #
  # The link for the problem in HackerRank is the following:
  # https://www.hackerrank.com/challenges/special-palindrome-again/problem
  class SpecialString
    def initialize(string)
      @string = string
    end

    # Complexity: (n: the size of the string)
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    #
    # How does it work:
    # The method map_ordered_ocurrences iterates over the string counting how
    # many times each character occurs in a sequence
    # Then, the method count_special_substring does the calculation of how many
    # special strings there will be. For each char count the rules for that are:
    #   - count is increased by the number of the arithmetic progression from 1
    #     up to the number of occurences of the current char
    #   - if the current char happened only once, and it's in between to
    #     occurencies of the same char, we sum the size of the smallest set of
    #     the wrapped character
    #
    # As an example, the string "aaaba" would get to a ordered_ocurrences with:
    #   [
    #      CharCount<char:a, char_count, 3>,
    #      CharCount<char:b, char_count, 1>,
    #      CharCount<char:a, char_count, 1>
    #   ]
    # and we the total number of special substring will be 9, because:
    #  - 6 for the a's (3 + 2 + 1)
    #  - 1 for the b
    #  - 1 for aba
    #  - 1 for the final a
    #
    # returns Integer
    def count_special_substrings
      ordered_ocurrences = map_ordered_ocurrences
      count_special_substring(ordered_ocurrences)
    end

    private

    # returns Array<CharCount>
    def map_ordered_ocurrences
      arr = []
      previous_char = ''
      char_count = CharCount.new
      @string.each_char do |char|
        if char != previous_char
          arr << char_count unless char_count.char.nil?
          char_count = CharCount.new(char)
        end
        char_count.char_count += 1
        previous_char = char
      end
      arr << char_count
    end

    # ordered_ocurrences: Array<CharCount>
    # returns integer
    def count_special_substring(ordered_ocurrences)
      count = 0
      (0..ordered_ocurrences.length - 1).each do |index|
        ocurrence = ordered_ocurrences[index]
        count += occurence_combinations(ocurrence) # Arithmetic Progression Sum
        count += wrapped_ocurrencies(ordered_ocurrences, index)
      end
      count
    end

    # ocurrence: CharCount
    # returns integer
    def occurence_combinations(ocurrence)
      char_count = ocurrence.char_count
      char_count * (1 + char_count) / 2
    end

    # ordered_ocurrences: Array<CharCount>
    # index:integer
    # return integer
    def wrapped_ocurrencies(ordered_ocurrences, index)
      count_is_one = ordered_ocurrences[index].char_count == 1
      out_of_boundaries = index < 1 || index >= ordered_ocurrences.length - 1

      return 0 if !count_is_one || out_of_boundaries

      previous_char_count = ordered_ocurrences[index - 1]
      next_char_count = ordered_ocurrences[index + 1]

      return 0 if previous_char_count.char != next_char_count.char

      [previous_char_count.char_count, next_char_count.char_count].min
    end
  end
end
