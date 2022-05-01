
module HackerRank
  class SpecialString
    def initialize(string)
      @string = string
      @total_calls = 0
    end

    def count_special_substrings
      count = 0

      (0..@string.length - 1).each do |index|
        count += count_special_substrings_from_index(index)
      end

      count
    end

    private


    def count_special_substrings_from_index(index_start)
      chars_count = {} # Hash char => integer
      count = 0

      prefix_count = 0
      suffix_count = 0

      (index_start..@string.length - 1).each do |index_end|
        @total_calls += 1

        char = @string[index_end]
        chars_count[char] ||= 0
        chars_count[char] += 1

        if chars_count.keys.length == 1 # only one char so far
          prefix_count += 1
        elsif char == @string[index_start] && chars_count.keys.length > 1
          suffix_count += 1
        end

        if special_substring?(chars_count, prefix_count, suffix_count)
          count += 1
        end

        break unless can_be_special_substring(chars_count, prefix_count, suffix_count)
      end

      count
    end

    def special_substring?(chars_count, prefix_count, suffix_count)
      chars_count.keys.length == 1 ||
        chars_count.keys.length == 2 &&  prefix_count == suffix_count
    end

    def can_be_special_substring(chars_count, prefix_count, suffix_count)
      chars_count.keys.length == 1 ||
        chars_count.keys.length == 2 && prefix_count > suffix_count
    end

  end
end
