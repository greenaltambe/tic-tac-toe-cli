# frozen_string_literal: true

# Represents a player in a game of Tic Tac Toe
# Provides attributes for the player's name and mark
class Player
  attr_accessor :name, :mark

  def initialize
    @name = ''
    @mark = ''
  end
end
