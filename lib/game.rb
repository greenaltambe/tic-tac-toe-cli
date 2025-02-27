# frozen_string_literal: true

require_relative 'matrix'
require_relative 'player'

# Represents a game of Tic Tac Toe.
# Provides methods for initializing the game, setting players, and running the game.
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
      break if game_end?
    end
  end

  def row_win?(player)
    @matrix.matrix.any? { |row| row.all? { |ele| ele == player.mark } }
  end

  def col_win?(player)
    @matrix.matrix.transpose.any? { |row| row.all? { |ele| ele == player.mark } }
  end

  def diagonal_win?(player)
    @matrix.matrix[0][0] == player.mark && @matrix.matrix[1][1] == player.mark && @matrix.matrix[2][2] == player.mark
  end

  def player_win?(player)
    row_win?(player) || col_win?(player) || diagonal_win?(player)
  end

  def someone_win?
    if player_win?(@player1)
      puts "#{@player1.name} wins"
    elsif player_win?(@player2)
      puts "#{@player2.name} wins"
    end
  end

  def game_end?
    return true if someone_win?
    return true if matrix.full? && puts('The game is a draw')

    false
  end
end
