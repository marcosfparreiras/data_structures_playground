# frozen_string_literal: true

module HackerRank
  # This class implements the solution to the Tries Contacts problem from
  # Hacker Rank.
  #
  # The link for the problem in HackerRank is the following:
  # https://www.hackerrank.com/challenges/ctci-contacts/problem?h_r=internal-search
  class TriesContacts
    def initialize
      @root = Node.new
    end

    def add(string)
      @root.add(string)
    end

    def find_count(string)
      @root.find_count(string)
    end

    # This is a helper class to model the nodes of the Trie
    class Node
      attr_reader :size

      def initialize(data = nil)
        @data = data
        @children = {}
        @size = 0 # number of words
      end

      def add(string)
        @size += 1
        return if string.empty?

        first_char = string[0]
        @children[first_char] = Node.new(first_char) if @children[first_char].nil?
        @children[first_char].add(string[1..-1])
      end

      def find_count(string)
        return @size if string.empty?

        first_char = string[0]
        return 0 if @children[first_char].nil?

        @children[first_char].find_count(string[1..-1])
      end
    end
  end
end
