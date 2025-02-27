require_relative 'matrix'
require_relative 'player'

class Game
  def initialize
    @matrix = Matrix.new
    @player1 = Player.new
    @player2 = Player.new
  end

  def start_game
    set_player(@player1)
    set_player(@player2)
    run_game
  end

  def set_player=(player)
    puts 'Enter player name'
    player.name = gets.chomp
    puts "#{player.name} choose your mark"
    player.mark = gets.chomp
  end

  def ask_player(player)
    puts "#{player.name} enter row and column"
    row, col = gets.chomp.split(' ')
    @matrix.update_board(row.to_i, col.to_i, player.mark)
  end

  def run_game
    loop do
      @matrix.print_board
      ask_player(@player1)
      @matrix.print_board
      ask_player(@player2)
      break if player_won?
    end
  end

  def player_won?
    
  end
end
