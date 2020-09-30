class Board
attr_reader :squares, :winning_combination
attr_writer :squares

    def initialize(squares, winning_combination)
        @squares =
        @winning_combination =
    end

    board = %w[1 2 3 4 5 6 7 8 9]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def update_board()
end
end