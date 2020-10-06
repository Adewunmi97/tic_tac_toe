def winner?(winning, score)
  # count = 0
  # while count < 9
  #   return item == score
  # end
  for win in winning
    return 'Winner' if win == score
  end
end

winning = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 5], [1, 4, 6], [2, 5, 8], [0, 4, 8], [2, 4, 5]]


p winner?(winning, [6, 7, 8])