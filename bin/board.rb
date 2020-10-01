require_relative './board.rb'
class Board
    attr_reader :board
    attr_accessor :player1, :player2
    def initialize()
        @board = Board.new
        @player1 = nil
        @player2 = nil
    end
end

