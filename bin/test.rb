def winner?(score)
  for win in WINNING_COMBINATION
    return win == score
  end
end

WINNING_COMBINATION = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 5], [1, 4, 6], [2, 5, 8], [0, 4, 8], [2, 4, 5]].freeze

puts winner?([0, 1, 7])