#!/usr/bin/env ruby
require_relative('./player')
require_relative('./game')
require_relative('./helper_module')

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

board = %w[1 2 3 4 5 6 7 8 9]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
welcome_message
display_board(board)

# name = 'Gilber'
# player1 = Player.new(name)
# puts player1.name

def players
  players_arr = []
  2.times do |i|
    puts "Player #{i + 1}, Please Enter Your Name: "
    current = Player.new
    current.name = gets.chomp.strip
    puts "Welcome #{current.name} : All the best"
    players_arr << current.name
  end
  players_arr
end
players_arr = players
print players_arr

puts ''
puts ''
puts "#{players_arr[0]} gets X and #{players_arr[1]} gets O"
puts 'All the best'
puts '__' * 70
display_board(board)

def user_input
  puts 'Enter Choice between 1 and 9'
  choice = gets.chomp.strip.to_i
  choice
end
user_input

puts HelperMethods.valid_input?(2)
# def free_cell?(board, choice)
#   return fal if board[choice - 1] == 'X' || board[choice - 1] == 'O'

#   true
# end

# def move(board, choice = 0)
#   while !valid_input?(choice) || !free_cell?(board, choice)
#     choice = user_input
#     puts 'Position taken' unless free_cell?(board, choice)
#   end
#   choice
# end
# puts "Choice is #{move(board)}"

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
