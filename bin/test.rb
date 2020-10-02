board = [1, 'X', 3, 4, 5, 'O', 7, 8, 9]
def user_input
  puts 'Enter Choice between 1 and 9'
  choice = gets.chomp.strip.to_i
  choice
end
choice = user_input
def valid_input?(choice)
  return false if !choice.is_a?(Integer) || !choice.between?(1, 9)
  true
end
puts valid_input?(choice)
def free_cell?(board, choice)
  return true if board[choice - 1] == 'X' || board[choice - 1] == 'O'
  false
end
puts free_cell?