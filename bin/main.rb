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


$game = Game.new
$template = $game.board
$player1 = $game.player1
$player2 = $game.player2

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
    name = gets.chomp.strip
    puts "Player #{i + 1}, Choose Tag: "
    tag = gets.chomp.strip
    if i == 0
      $player1 = Player.new(name, tag)
    else
      $player2 = Player.new(name, tag)
    end
    puts $game.player1
    puts $game.player2
    puts "Welcome #{name} : All the best"
    players << name
  end
  players_arr
end
players_arr = players
print players_arr

welcome_message
display_board($template.board)
puts ''
puts ''
puts "#{players_arr[0]} gets X and #{players_arr[1]} gets O"
puts 'All the best'
puts '__' * 70
display_board($template.board)

def user_input
  puts 'Enter Choice between 1 and 9'
  choice = gets.chomp.strip.to_i
end

def valid_input?(choice)
  while choice.is_a?(String) || !choice.between?(1, 9)
    choice = user_input
  end
  # if choice.is_a?(String) || !choice.between?(1, 9)
  #   false
  # else
  #   true
  # end
  choice
end

# def free_cell?(board, choice)
#   return false if board[choice - 1] == 'X' || board[choice - 1] == 'O'

#   true
# end

def move(board, choice)
  while !valid_input?(choice) || !board.free_cell?(choice)
    choice = user_input
    puts 'Position taken' unless board.free_cell?(choice)
  end
  choice
end
puts "Choice is #{move($template, user_input)}"

# def play(player_arr, board)
#   count = 0
#   while count < 9
#     player_arr.each_with_index do |player, index|
#       puts "It is #{player}'s turn"
#       choice = user_input
#       move(board, choice)   
#     end
#     return "Its a draw " if count == 9
#     count += 1
#   end
# end
# play(players_arr, board)

play(player_arr, $template.board, user_input)

# play(player_arr, board, user_input)

# def check_winner(_player_arr, _board, _move)
#   puts 'Winner'
# end
