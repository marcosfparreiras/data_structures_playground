# frozen_string_literal: true

require 'stack'

# This class implements a checker to check if a string of brackets is balanced
class BalancedBracketsChecker
  MATCHING_BRACKETS = {
    ')' => '(',
    ']' => '[',
    '}' => '{'
  }.freeze

  OPENING_BRACKEST = MATCHING_BRACKETS.values.freeze
  CLOSING_BRACKEST = MATCHING_BRACKETS.keys.freeze

  def initialize
    @stack = Stack.new
  end

  # string: String
  def check(string)
    string.chars.each do |character|
      if OPENING_BRACKEST.include?(character)
        @stack.push(character)
      elsif CLOSING_BRACKEST.include?(character)
        return false if MATCHING_BRACKETS[character] != @stack.pop
      else
        raise ArgumentError
      end
    end
    @stack.empty?
  end
end
