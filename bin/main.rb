#!/usr/bin/env ruby

def welcome_message
  puts '__' * 70
  puts '                 WELCOME TO THE WONDER GAME OF TIC TIC TOE'
  puts '                       Lets get ready to rumble!!!'
  puts '__' * 70
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

def player_move(player_arr, board)
  game_acc_moves = []
  while game_acc_moves.length <= 8 do
    player_arr.each_with_index do |player, index|
      puts ''
      puts "It is #{player}'s turn"
      choice = 0
      until choice.between?(1, 9) && !game_acc_moves.include?(choice)
        puts 'Enter choice between 1 and 9'
        choice = gets.chomp.strip.to_i      
        if game_acc_moves.include?(choice)
          puts 'Position Already taken'
        end
      end
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
  game_acc_moves
end
player_move(player_arr, board)

# def check_winner(board)
