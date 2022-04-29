module HackerRank
  class RecursiveDigitSum
    # string_number: String
    # repetition_times: Integer
    def initialize(string_number, repetition_times)
      @string_number = string_number
      @repetition_times = repetition_times
    end

    # returns Integer
    def super_digit
      number_superdigit = super_digit_recursive(@string_number)

      super_digit_recursive((number_superdigit * @repetition_times).to_s)
    end

    # number: String
    # returns: Integer
    def super_digit_recursive(number)
      return number.to_i if number.size == 1

      sum = 0
      number.each_char do |char|
        sum += char.to_i
      end

      super_digit_recursive(sum.to_s)
    end
  end
end
