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
end
