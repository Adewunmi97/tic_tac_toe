

WINNING_COMBINATION = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 5], [1, 4, 6], [2, 5, 8], [0, 4, 8], [2, 4, 5]].freeze
board = ['X', 'O' , 'X', 'X', 'X', 'X', 9]

def winner?(board)
  for win in WINNING_COMBINATION
    p board & win
  end
end

puts winner?([0, 1, 2])
# def test_set_arr(board)
#   arr = []
#   board.each_with_index do |item, inx|
#     if item == 'X'
#       arr << inx
#       #  p arr 
#     end
#   end
#   return arr
# end

# print test_set(board)



# for win in WINNING_COMBINATION
#   # puts "Win and test #{win & test_s}"
# end
# test_data = test_set(board)
# def winner?(test_set)
#   for win in WINNING_COMBINATION do
#     if win == test_data & win
#       puts "test the fun = #{test_data & win}"
#       puts "Winnner"
#     end
#   end
# end
