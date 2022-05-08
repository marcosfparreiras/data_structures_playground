# frozen_string_literal: true

module HackerRank
  # This class implements the solution to the NewYearChaos problem from
  # Hacker Rank.
  #
  # The link for the problem in HackerRank is the following:
  # https://www.hackerrank.com/challenges/ctci-connected-cell-in-a-grid/problem
  class ConnectedGrid
    def initialize(grid)
      @grid = grid
      @rows = @grid.size
      @columns = @grid[0].size
    end

    # Complexity (n: number of rows in the grid; m: number of columns)
    # Time complexity: O(n x m)
    # Space complexity: O(n x m)
    #
    # How does it work?
    # We iterate over the matrix finding the 1s in it. For each of the 1s in the
    # matrix, we apply a DFS to find the total number of 1s connected to it.
    # This is done recursively. Also, whenever we visit a 1 in the grid, we set
    # it to 0, so that this element will never be visited again, and we can do
    # it without using any extra space (other than the grid itself)
    #
    # returns Integer
    def max_connected_cell
      max_size = 0
      (0..@rows - 1).each do |row|
        (0..@columns - 1).each do |col|
          next if @grid[row][col] == 0

          size = connected_cell_size(row, col)
          max_size = size if size > max_size
        end
      end
      max_size
    end

    # Apply DFS recursively over the current element finding all the 1s
    # connected to it
    #
    # row: Integer. The row of the element whose cell we want to inspect
    # col: Integer. The column of the element whose cell we want to inspect
    # return Integer
    def connected_cell_size(row, col)
      @grid[row][col] = 0
      size = 1

      (row - 1..row + 1).each do |row_to_search|
        (col - 1..col + 1).each do |col_to_search|
          if valid_entry?(row_to_search, col_to_search) && @grid[row_to_search][col_to_search] == 1
            size += connected_cell_size(row_to_search, col_to_search)
          end
        end
      end
      size
    end

    def valid_entry?(row, col)
      valid_row = row >= 0 && row < @rows
      valid_column = col >= 0 && col < @columns
      valid_row && valid_column
    end
  end
end
