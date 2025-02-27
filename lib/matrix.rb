# frozen_string_literal: true

# Represents a 3x3 matrix
# Provides methods for printing the matrix, updating the matrix, and checking if the matrix is full
class Matrix
  def initialize
    @matrix = Array.new(3) { Array.new(3) }
  end

  def print_board
    matrix.each do |row|
      row.each do |ele|
        puts "#{ele} | "
      end
      puts ''
    end
  end

  def update_board(row, col, mark)
    @matrix[row][col] = mark
  end

  def full?
    @matrix.all? { |row| row.all? { |ele| ele != '' } }
  end
end
