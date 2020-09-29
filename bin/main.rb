#!/usr/bin/env ruby

def welcome_message
  puts '__' * 50
  puts ''
  puts '                      WELCOME TO THE WONDER GAME OF TIC TIC TOE'
  puts '                             Lets get ready to rumble!!!'
  puts '__' * 50
  puts ''
  puts 'Players take turns to select from 9 positions on the board below'
  puts 'First to make a horizontal or vertical line of their selection wins'
  puts ''
end

board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def players
  players = []
  2.times do |i|
    puts "Player #{i + 1}, Please Enter Your Name: "
    current = gets.chomp.strip
    puts "Welcome #{current} : All the best"
    players << current
  end
  players
end


welcome_message
display_board(board)
puts ''
 puts ''
 player_arr = players
puts "#{player_arr[0]} gets X and #{player_arr[1]} gets O"
puts 'All the best'
puts '__' * 70
display_board(board)

def get_user_input
  puts "Enter Choice between 1 and 9"
  choice = gets.chomp.strip.to_i
  choice    
end

def valid_input?(choice)
  if choice.is_a?(String) || !choice.between?(1, 9)
    return false
  else
    true
  end
end

def free_cell?(board, choice)
  return false if board[choice -1] == 'X' || board[choice -1] == 'O'
  true
end 

def move(board, choice=0)  
  while !valid_input?(choice) || !free_cell?(board, choice)
    choice = get_user_input 
    if !free_cell?(board, choice)
      puts 'Position taken'
    end
  end
  return choice
end
puts "Choice is #{move(board)}"

def play(player_arr, board, get_user_input)
  game_acc_moves = []
  while game_acc_moves.length <= 8 do
    player_arr.each_with_index do |player, index|
      puts ''
      puts "It is #{player}'s turn"
      choice = move(board, get_user_input)
      game_acc_moves << choice
      if index == 0
        board[choice - 1] = 'X'
        print board
      elsif index == 1
        board[choice - 1] = 'O'
      end
      puts "Acc game moves #{game_acc_moves} \n"
      display_board(board)
    end
  end
end

play(player_arr, board, get_user_input)


def check_winner(player_arr, board, move )
end