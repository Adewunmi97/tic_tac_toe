class Board
attr_reader :board, :winning_combination

    def initialize()
        @board = %w[1 2 3 4 5 6 7 8 9]
        @winning_combination = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    end

    board = %w[1 2 3 4 5 6 7 8 9]
# def display_board(board)
#   puts " board#{board[0]} | #{board[1]} | #{board[2]} "
#   puts '-----------'
#   puts " #{board[3]} | #{board[4]} | #{board[5]} "
#   puts '-----------'
#   puts " #{board[6]} | #{board[7]} | #{board[8]} "
# end

  def free_cell?(choice)
    board[choice - 1]  == 'X' || board[choice - 1] == 'O'
  end

  def update_board(index, user_tag)
    board[index] = user_tag
  end
end