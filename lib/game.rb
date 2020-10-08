class Game
  attr_accessor :player1, :player2, :board, :winning_combination
  def initialize()
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @winning_combination = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    @player1 = nil
    @player2 = nil
  end

  def int_between_1_and_9?(input)
    input.is_a?(Integer) && input.between?(0, 8)
  end

  def position_taken?(board, input)
    board[input] == 'X' || board[input] == 'O'
  end

  def valid?(board, input)
    !position_taken?(board, input) && int_between_1_and_9?(input)
  end
end
