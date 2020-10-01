require_relative './player'
require_relative './board'

class Game
  def initialize
    @players = []
    board = Board.new
  end
  def valid_input?(choice)
    if choice.is_a?(String) || !choice.between?(1, 9)
      false
    else
      true
    end
  end
end