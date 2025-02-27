# frozen_string_literal: true

# Represents a 3x3 matrix
# Provides methods for printing the matrix, updating the matrix, and checking if the matrix is full
class Matrix
  attr_accessor :matrix

  def initialize
    @matrix = Array.new(3) { Array.new(3) }
    @matrix.map! { |row| row.map { '' } }
  end

  def print_board
    puts '================================='
    @matrix.each do |row|
      row.each do |ele|
        print "#{ele}  " if ele != ''
        print '-  ' if ele == ''
      end
      puts ''
    end
    puts '================================='
  end

  def update_board(row, col, mark)
    @matrix[row][col] = mark
  end

  def full?
    @matrix.all? { |row| row.all? { |ele| ele != '' } }
  end

  def used?(row, col)
    @matrix[row][col] != ''
  end
end
