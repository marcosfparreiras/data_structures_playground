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
      initial_number = @string_number.to_i * @repetition_times
      super_digit_recursive(initial_number)
    end

    # number: Integer
    # returns: Integer
    def super_digit_recursive(number)
      return number if number < 10

      super_digit_recursive(sum_digits(number))
    end

    private

    # number: Integer
    # returns: Integer
    def sum_digits(number)
      sum = 0
      while number >= 10 do
        sum += number % 10
        number /= 10
      end
      sum += number
    end
  end
end
