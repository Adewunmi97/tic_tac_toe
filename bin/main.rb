#!/usr/bin/env ruby
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

def welcome_message
  puts '__' * 50
  puts ''
  puts '                      WELCOME TO THE WONDER GAME OF TIC TIC TOE'
  puts '__' * 50
  puts ''
  puts 'Players take turns to select from 9 positions on the board below'
  puts 'First to make a horizontal or vertical line of their selection wins'
  puts ''
end

board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


# winning_combination = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 6], [2, 5, 7], [3, 6, 9], [1, 5, 9], [3, 5, 6]]
winning_combination = [
  [board[0], board[1], board[2]],
  [board[3], board[4], board[5]],
  [board[6], board[7], board[8]],
  [board[0], board[3], board[5]],
  [board[1], board[4], board[6]],
  [board[2], board[5], board[8]],
  [board[0], board[4], board[8]],
  [board[2], board[4], board[5]]
]

# #gets player names

def player_names
  players = []
  2.times do |i|
    name =''
    loop do
      puts "player #{i + 1} please Enter Your Name"
      name = gets.chomp.upcase
      break if name.length > 0
      puts "Invalid Entry"
    end
    puts "Welcome #{name} :"
    players << name
  end
  players
end
display_board(board)
players = player_names

player1 = Player.new(players[0], 'X')
player2 = Player.new(players[1], 'O')
puts "#{player1.name} vs #{player2.name}"
puts 'Let the games begin'

def user_input
  puts 'Enter Choice between 1 and 9'
  choice = gets.chomp.strip.to_i - 1
  choice
end

def valid_input?(choice)
  return false if !choice.is_a?(Integer) || !choice.between?(1, 9)
  true
end

def free_cell?(board, choice)
  return false if board[choice - 1] == 'X' || board[choice - 1] == 'O'
  true
end

def move(player, board)
  # player.score = []
  choice = user_input
  # while !valid_input?(choice) || !free_cell?(board, choice)
  #   puts 'Position taken'
  # end
  board[choice] = player.tag
  # player.score << choice
  # print "Score = #{player.score}"
end

# score = move(player1, board)
# p score
def winner?(player, winning_combination)
  winning_combination.each do |win_arr|
    if win_arr.all? {|i| i == player.tag}
      puts "#{player} wins "
    # p win_arr
    end
  end
end

def play(player1, player2, board, winning_combination)
  count = 0
  while count < 9
    2.times do |i|
      if i == 0
        # move(player1, board)
        player1.score << move(player1, board)
        print "#{player1.score} \n"
        display_board(board)
        winner?(player1, winning_combination)
        player1.score
      else
        # move(player2, board)
        player2.score << move(player2, board)
        print "#{player2.score} \n"
        display_board(board)
        winner?(player2, winning_combination)
        player2.score
      end
    end
    count += 1
  end
  [per1.scorelay, player2.score]
end
scores = play(player1, player2, board, winning_combination)
p scores


# def move(ayer, board)
#   score = []
#   puts "#{player} its your turn"
#   choice = valid_input?(user_input).t
#   # free_cell?(board, choice)
#   board[choice] = player.tag
#   score << choice
# end
# def turn(player1, player2, board)
#   count = 0
#   while count < 9
#     move(player1, board)
#     move(player2, board)
#     count += 1
#   end
# end
# turn(player1,player2, board )
# def players
#   player_arr = []
#   2.times do |i|
#     name = ''
#     loop do
#       puts "Player #{i + 1}, Please Enter Your Name: "
#       name = gets.chomp.strip.upcase
#         puts "Invalid Entry"  if name.length <= 0
#         break
#     end
#     # loop do
#     #   puts "Player #{i + 1}, Choose Your Symbol X or O: "
#     #   tag = gets.chomp.strip.upcase
#     #   break if tag == 'X' || tag == 'O'
#     # end
#     # if i == 0
#     #   $player1 = Player.new(name, tag, [])
#     # else
#     #   $player2 = Player.new(name, tag, [])
#     # end
#     puts "Welcome #{name} : All the best"
#     puts ''
#     puts ''
#     player_arr << name
#   end
#    player_arr
# end

# welcome_message
# display_board(board)
# puts ''
# puts ''
# player_arr = players
# puts 'All the best'
# puts '__' * 70
# display_board(board)

# def user_input
#   puts 'Enter Choice between 1 and 9'
#   choice = gets.chomp.strip.to_i
#   choice
# end

# def valid_input?(choice)
#   return false if !choice.is_a?(Integer) || !choice.between?(1, 9)
#   true
# end


# def move(board, choice)
#   while !valid_input?(choice) || !free_cell?(board, choice)
#     choice = user_input
#     puts 'Position taken' unless free_cell?(board, choice)
#   end
#   choice
# end
# move(board, choice)
# selection = move(board, user_input)

# def check_winner(winning_combination, board)
#   winning_combination.each do |item|
#     print "DDDDDDDDDDDDDDD"
#     if item.all? {|i| i == 'X'}
#       puts "Winner is X"
#       break
#     elsif item.all? {|i| i == 'O'}
#       puts "O wins"
#       break
#     end
#   end
# end



# def play(winning_combination, player_arr, board, choice)
#   count = 0
#   game_acc_moves = []
#   while count < 8
#     score = []
#     2.times do |i|
#       if i == 0
#         puts "It is #{$player1.name}'s turn "
#         choice = move(board, user_input)
#         score << choice
#         board[choice - 1] = $player1.tag
#         p "sc = #{score}"
#         display_board(board)
#         check_winner(winning_combination, board)
#         p board
#       else
#         puts "It is #{$player2.name}'s turn "
#         choice = move(board, user_input)
#         score << choice
#         board[choice -1] = $player1.tag
#         p "sc = #{score}"
#         board[choice] = $player2.tag
#         p board
#         display_board(board)
#       end
#     end
#     game_acc_moves
#   end
# end
# play(winning_combination, player_arr, board, selection)





# def play(player_arr, board, winning_combination)
#   count = 0
#   while count < 9
#     player_arr.each_with_index do |player, index|
#       puts ''
#       puts "It is #{player}'s turn'"
#       choice = move(board, user_input)
#       p total
#       if index.zero?
#         board[choice - 1] = 'X'
#         check_winner(board, winning_combination)
#       elsif index == 1
#         board[choice - 1] = 'O'
#         check_winner(board, winning_combination)
#       end
#       display_board(board)
#       print "board = #{board}"
#     end
#     return 'Its A Draw' if count == 8
#     count += 1
#   end
# end


# def check_winner(board, winning_combination)
#   for win in winning_combination
#     if board.select { |i| i == 'X' } == win
#       return  'X Wins'
#     elsif board.select { |i| i == 'X' } == win
#       return 'O wins'
#     end
#   end
# end
# play(player_arr, board, winning_combination )

# def play(player_arr, board, user_input)
#   game_acc_moves = []
#   while game_acc_moves.length <= 8
#     player_arr.each_with_index do |player, index|
#       puts ''
#       puts "It is #{player}'s turn"
#       choice = move(board, user_input)
#       game_acc_moves << choice
#       if index.zero?
#         board[choice - 1] = 'X'
#         print board
#       elsif index == 1
#         board[choice - 1] = 'O'
#       end
#       puts "Acc game moves #{game_acc_moves} \n"
#       display_board(board)
#     end
#   end
# end

# play(player_arr, board, user_input)

# def check_winner(_player_arr, _board, _move)
#   puts 'Winner'
# end

# def welcome_message
#   puts '__' * 50
#   puts ''
#   puts '                      WELCOME TO THE WONDER GAME OF TIC TIC TOE'
#   puts '__' * 50
#   puts ''
#   puts 'Players take turns to select from 9 positions on the board below'
#   puts 'First to make a horizontal or vertical line of their selection wins'
#   puts ''
# end

# $game = Game.new
# $template = $game.board
# puts "Team #{$template}"
# $player1 = $game.player1
# $player2 = $game.player2


# def display_board(board)
#   puts " #{board[0]} | #{board[1]} | #{board[2]} "
#   puts '-----------'
#   puts " #{board[3]} | #{board[4]} | #{board[5]} "
#   puts '-----------'
#   puts " #{board[6]} | #{board[7]} | #{board[8]} "
# end

# def players
#   players = []
#   2.times do |i|
#      puts "Player #{i + 1}, Please Enter Your Name: "
#     while name = gets.chomp.strip
#       if !name.is_a?(String)
#         puts "Ivalid name"
#       else
#         break if name.is_a?(String)
#       end
#     end
#     name = gets.chomp.strip
#     puts "Player #{i + 1}, Choose Tag: "
#     tag = gets.chomp.strip
#     if i == 0
#       $player1 = Player.new(name, tag)
#     else
#       $player2 = Player.new(name, tag)
#     end
#     puts $game.player1
#     puts $game.player2
#     puts "Welcome #{name} : All the best"
#     players << name
#   end
#   players
# end

# welcome_message
# display_board($template.board)
# puts ''
# puts ''
# player_arr = players
# puts "#{player_arr[0]} gets X and #{player_arr[1]} gets O"
# puts 'All the best'
# puts '__' * 70
# display_board($template.board)

# def user_input
#   puts 'Enter Choice between 1 and 9'
#   return gets.chomp.strip.to_i
# end
# choice = user_input
# def valid_input?(choice)
#   while choice.is_a?(String) || !choice.between?(1, 9)
#     choice = user_input
#   end
#   # if choice.is_a?(String) || !choice.between?(1, 9)
#   #   false
#   # else
#   #   true
#   # end
#   choice
# end

# # def free_cell?(board, choice)
# #   return false if board[choice - 1] == 'X' || board[choice - 1] == 'O'
# #   true
# # end
# # free_cell?($template, choice)

# # def move(board, choice)
# #   while !valid_input?(choice) || !board.free_cell?(choice)
# #     choice = user_input
# #     # puts 'Position taken' unless board.free_cell?(choice)
# #   end
# #   choice
# # end

# def move(board, choice = 0)
#   while !valid_input?(choice)
#     return choice if valid_input?(choice)
#     puts 'Invalid Entry'
#   end
# end
# # puts "Choice is #{move(board)}"

# move($template, choice)
# # puts "Choice is #{move($template, user_input)}"

# def play(player_arr, board, user_input)
#   game_acc_moves = []
#   while game_acc_moves.length <= 8
#     player_arr.each_with_index do |player, index|
#       puts ''
#       puts "It is #{player}'s turn"
#       choice = move(board, user_input)
#       game_acc_moves << choice
#       if index.zero?
#         board[choice - 1] = 'X'
#         print board
#       elsif index == 1
#         board[choice - 1] = 'O'
#       end
#       puts "Acc game moves #{game_acc_moves} \n"
#       display_board(board)
#     end
#   end
# end

# # play(player_arr, $template.board, user_input)

# # def check_winner(_player_arr, _board, _move)
# #   puts 'Winner'
# # end