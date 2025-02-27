require_relative 'matrix'
require_relative 'player'

class Game
  def initialize
    @matrix = Matrix.new
    @player1 = Player.new
    @player2 = Player.new
  end

  def start_game
    puts 'Enter player 1 name'
    @player1.name = gets.chomp
    puts "#{@player1.name} choose your mark"
    @player1.mark = gets.chomp

    puts 'Enter player 2 name'
    @player2.name = gets.chomp
    puts "#{@player2.name} choose your mark"
    @player2.mark = gets.chomp

    self.run_game
  end

  def run_game
    loop do 
      @matrix.print_board
      puts "#{@player1.name} enter row and column"
      row, col = gets.chomp.split(' ')
      @matrix.update_board(row.to_i, col.to_i, @player1.mark)

      @matrix.print_board
      puts "#{@player2.name} enter row and column"
      row, col = gets.chomp.split(' ')
      @matrix.update_board(row.to_i, col.to_i, @player2.mark)

      self.check_win
    end
  end

  def check_win
    
  end
end
