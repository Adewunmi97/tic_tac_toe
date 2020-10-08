require_relative './board.rb'
class Game
    attr_accessor :board
    attr_accessor :player1, :player2
    def initialize(player1, player2)
        @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        @player1 = nil
        @player2 = nil
    end

    def player_input
      gets.chomp.to_i - 1
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
    def winner?(player, board)
      tot = []
      WINNING_COMBINATION.each do |comb|
        score = board.each_index.select{|i| board[i] == player.tag}
        tot = score & comb
      end
      return true if tot.length == 3
    end
  end
end

