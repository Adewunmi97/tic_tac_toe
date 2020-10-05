WINNING_COMBINATION = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 5], [1, 4, 6], [2, 5, 8], [0, 4, 8], [2, 4, 5]].freeze
def winner?(score)
  for win in WINNING_COMBINATION
    return true if win == score
  end
end

p winner?([0, 1, 2])