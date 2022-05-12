# frozen_string_literal: true

module LeetCode
  # Implements the solution for the problem Maximal Rectangle, from LeetCode
  #
  # The link for the problem in LeetCode is the following:
  # link: https://leetcode.com/problems/maximal-rectangle/
  #
  # The link for the submission is:
  # https://leetcode.com/submissions/detail/698345562/
  class MaximalRectangle
    # matrix: Array<Array<Character>>
    def initialize(matrix)
      @matrix = matrix
    end

    # Complexity (n: number of rows in the matrix; m: number of columns)
    # Time complexity: O(m + n)
    # Space complexity: O (m + n)
    #
    # How does it work?
    # We break the problem into two steps:
    # 1- we transform the given matrix into a histogram representation of how
    #    many 1s are vertically connected to the current 1 (from above)
    # 2- we calculate the maximum area of each row in the transformed matrix
    #    (each row represents then a histogram)
    #
    # Example:
    # matrix:
    #           1 0 1 0 0
    #           1 0 1 1 1
    #           1 1 1 1 1
    #           1 0 0 1 0
    #
    # We iterate over each element from left-right top-down and create a new
    # matrix representing how many 1s vertically from top-down this position
    # has in the original matrix. This operation has time complexity of O(m x n)
    # and space complexity of O(m x n), given that we iterate each element only
    # once, and we use extra space exaclty the same size as the original matrix.
    # With that, we end up the following new matrix:
    #
    # histograms_matrix:
    #           1 0 1 0 0
    #           2 0 2 1 1
    #           3 1 3 2 2
    #           4 0 0 3 0
    #
    # Once we get this hisograms matrix, all we have to do is to calculate the
    # largest area for each of the histograms (each of the rows of the matrix),
    # and get which is the greatest value between them. The calculation of the
    # largest area of a histogram is done by the class
    # LargestRectangleInHistogram below.
    #
    # return Integer
    def calculate
      histograms = generate_histrograms
      histograms.map { |h| LargestRectangleInHistogram.new(h).calculate }.max
    end

    def generate_histrograms
      histograms_matrix = initialize_histogram_matrix

      @matrix.each_index do |row|
        @matrix[row].each_index do |col|
          if @matrix[row][col] == '0'
            histograms_matrix[row][col] = 0
          else
            compare_value = row == 0 ? 0 : histograms_matrix[row - 1][col]
            histograms_matrix[row][col] = compare_value + 1
          end
        end
      end

      histograms_matrix
    end

    private

    def initialize_histogram_matrix
      Array.new(@matrix.length) do
        Array.new(@matrix[0].length)
      end
    end
  end

  # Implements the solution for the problem Largest Rectangle in Histogram,
  # from LeetCode, and is used as part of the solution for the Maximal Rectangle
  # problem (see above)
  #
  # The link for the problem in LeetCode is the following:
  # link: https://leetcode.com/problems/largest-rectangle-in-histogram/
  #
  # The link for the submission is:
  # https://leetcode.com/submissions/detail/698346278/
  class LargestRectangleInHistogram
    def initialize(nums)
      @nums = nums
    end

    # Complexity (n: number of elements in the array)
    # Time complexity: O(n)
    # Space complexity: O (n)
    #
    # How does it work?
    # In order to calculate the largest area of a histogram, we can use a
    # stack to hold the information of when was the starting point of a value
    # in the histogram.
    # The key concept it that, when explore the histogram to the right, if the
    # following value is greater than the previous one, the previous value can
    # extend up to this next point. When a next value is smaller than the last
    # one, then the greater value can not extend anymore, and we than need to
    # calculate which is the area related to it. We can simply do it by removing
    # this value from the stack, and calculating the area as:
    #   (the_current_index - start_index_for_the_value) * value
    #
    # After we do that for all elements, there might be still elements in the
    # stack (in case no smaller element came). We then just need to calculate
    # the area for each of those and see if any of those would be the maximum
    # area.
    #
    # An example:
    # histogram: [2, 1, 5, 6, 2, 3]
    #
    # --------------
    # Iteration 1:
    #   index = 0; height = 2; stack = []; max_area = 0
    #
    #   We start iterating over index 0 (2). As the stack is empty, we can
    #   simply add to it the start index being the current one (0), and the
    #   hight being the value for that (2).
    #
    # --------------
    # Iteration 2:
    #   index = 1; height = 1; stack = [[0, 2]]; max_area = 0
    #
    #   As the new hight is smaller than the one at the top of the stack, we
    #   pop that value and calculate the area for it. The start_index was 0,
    #   current_index is 1 and hight is 2. The are is (1 - 0) * 2 = 2. This
    #   value is greater than the previous max_area, so it is updated. We then
    #   add to the stack the element [0, 1]. 0 was the start position of the
    #   previous value, so it's valid for the new one for sure.
    #
    # --------------
    # Iteration 3:
    #   index = 2; height = 5; stack = [[0, 1]]; max_area = 2
    #
    #   The new value is greater than the top in the stack, so we don't pop
    #   anything, and just add the new element to the stack [2, 5]. 2 is the
    #   current index, and 5 is the value related to it.
    #
    # --------------
    # Iteration 4:
    #   index = 3; height = 6; stack = [[0, 1], [2, 5]]; max_area = 2
    #
    #   The new value is greater than the top in the stack, so we don't pop
    #   anything, and just add the new element to the stack [3, 6]. 3 is the
    #   current index, and 6 is the value related to it.
    #
    # --------------
    # Iteration 5:
    #   index = 4; height = 2; stack = [[0, 1], [2, 5], [3, 6]]; max_area = 2
    #
    #   The new height is smaller than the one at the top of the stack. We then
    #   pop the top element and calculate its area. We pop [3, 6]. The area
    #   related to that is (index - start_index) * peek_height, what will be
    #   (4 - 3) * 6 = 6. This is greater than the greates area, so max_area
    #   is updated to 6.
    #   Afetr his, the stack peek is still greater than the current height,
    #   so we do the same process again. We pop [2, 5] and calulate its area,
    #   which will be (4 - 2) * 5 = 10. This is greater than the previous value
    #   for the max_area (6), so the variable is updated to 10.
    #   After that, the stack peek has lower height (1) than the current one
    #   (2), so se just add it to the stack with the start_index being the same
    #   as the one from the last element poped (last element had
    #   start_index = 3), so we add [3, 2] to the stack
    #
    # --------------
    # Iteration 6:
    #   index = 5; height = 3; stack = [[0, 1], [4, 2]]; max_area = 10
    #
    #   The new height (3) is greater than the one in the peek of the stack (5).
    #   With that, we just add the new element [5, 3] to the top of the stack.
    #
    #
    # --------------
    # Checking remaining values in the stack.
    #   stack: [[0, 1], [3, 2], [5, 3]]; max_area = 10
    #
    #   At this point, the stack still has some values, and we have to calculate
    #   the area related to each of those. This can be done by calculating
    #   (array_size - start_index) * height of each element.
    #
    #   [0, 1] => (6 - 0) * 1 = 6
    #   [3, 2] => (6 - 3) * 2 = 6
    #   [5, 3] => (6 - 5) * 3 = 3
    #
    #   None of these elements are greater than max_area (10), so that is the
    #   value returned
    #
    # Note: A good video explaining the approach can be found at:
    # https://www.youtube.com/watch?v=zx5Sw9130L0&ab_channel=NeetCode
    #
    # return Integer
    def calculate
      max_area = 0
      stack = [] # (start_index, height)

      @nums.each_with_index do |height, index|
        start_index = index

        while !stack.empty? && height < stack.last[1]
          peek_index, peek_height = stack.pop
          peek_area = peek_height * (index - peek_index)
          max_area = [max_area, peek_area].max
          start_index = peek_index
        end

        stack.append([start_index, height])
      end

      compare_max_area_with_remaining_stack_values(stack, max_area)
    end

    private

    def compare_max_area_with_remaining_stack_values(stack, max_area)
      final_index = @nums.length
      stack.each do |(start_index, height)|
        area = height * (final_index - start_index)
        max_area = [max_area, area].max
      end

      max_area
    end
  end
end

# # This is how we need to run it on LeetCode
# # @param {Character[][]} matrix
# # @return {Integer}
# def maximal_rectangle(matrix)
#   LeetCode::MaximalRectangle.new(matrix).calculate
# end
