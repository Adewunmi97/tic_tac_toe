require_relative './board.rb'
class Game
    attr_accessor :board
    attr_accessor :player1, :player2
    def initialize()
        @board = Board.new
        @player1 = nil
        @player2 = nil
    end
end