require_relative './player'
require_relative './board'

class Game
  def initialize
    @players = []
    board = Board.new
  end
  def valid_input?(choice)
    return false if !choice.is_a?(Integer) || !choice.between?(1, 9)
    true
  end
end