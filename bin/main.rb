#!/usr/bin/env ruby
# rubocop: disable Metrics/MethodLength
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

game = Game.new

def space
  puts ''
end

def welcome_message
  puts '_' * 80
  space
  puts '                      WELCOME TO THE WONDER GAME OF TIC TIC TOE'
  puts '_' * 80
  space
  puts 'Players take turns to select from 9 positions on the board below'
  puts 'First to make a horizontal or vertical line of their selection wins'
  space
end

def player_input
  space
  space
  puts 'Please Select Spot 1 - 9'
  space
  gets.chomp.to_i - 1
end

def display_board(board)
  space
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def player_names
  players = []
  2.times do |i|
    name = ''
    loop do
      space
      puts "player #{i + 1} please Enter Your Name"
      space
      name = gets.chomp.upcase
      break if name.length.positive?

      puts 'Invalid Entry'
    end
    puts "Welcome #{name} :"
    players << name
  end
  players
end

def welcome_players(players)
  space
  puts '_' * 50
  space
  space
  puts "                        #{players[0].name}  vs  #{players[1].name}"
  puts '                    Let the games begin'
  puts '                       Select from 1-9'
  puts '_' * 50
  space
end

def end_game
  puts 'Thank You For Playing Tic Tac Toe'
  puts 'Game on Vanilla Ruby Build by Gilbert Gotora & Shonibare Adewunmi Comfort'
end

def restart(game, board)
  space
  space
  space
  puts 'Do You Want To Play Again?'
  puts 'Enter Y or N'
  loop do
    option = gets.chomp.upcase
    if option == 'Y'
      board[0] = 1
      board[1] = 2
      board[2] = 3
      board[3] = 4
      board[4] = 5
      board[5] = 6
      board[6] = 7
      board[7] = 8
      board[8] = 9
      play(game, board)
    elsif option == 'N'
      end_game
    else
      restart(game, board)
    end
  end
end

def move(game, player, board)
  input = player_input
  if game.valid?(board, input)
    board[input] = player.tag
    display_board(board)
    game.winning_combination.each do |com|
      score = board.each_index.select { |i| board[i] == player.tag }
      puts "#{player.name} WINS" if (com - score).empty?
      restart(game, board) if (com - score).empty?
    end
  elsif game.position_taken?(board, input)
    puts "Position #{board[input]} taken - Try Again"
    move(game, player, board)
  else
    puts 'Invalid Entry - Try Again'
    move(game, player, board)
  end
  input
end

def play(game, board)
  welcome_message
  display_board(board)
  players = player_names
  player1 = Player.new(players[0], 'X')
  player2 = Player.new(players[1], 'O')
  players = [player1, player2]
  welcome_players(players)
  display_board(board)
  5.times do |x|
    2.times do |i|
      move(game, players[i], board)
      # if full_board?(board)
      puts x
      if x == 4
        puts 'Its a draw!!!'
        restart(game, board)
      end
    end
  end
end

play(game, game.board)

# rubocop:enable Metrics/MethodLength
