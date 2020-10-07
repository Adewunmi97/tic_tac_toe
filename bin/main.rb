#!/usr/bin/env ruby
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

class Player
  attr_accessor :name, :score, :tag
  def initialize(name, tag)
    @name = name
    @tag = tag
    @score = []
  end
end

def space
  puts ''
end

def line
  puts '_'
end

def welcome_message
  line * 50
  space
  puts '                      WELCOME TO THE WONDER GAME OF TIC TIC TOE'
  line * 50
  space
  puts 'Players take turns to select from 9 positions on the board below'
  puts 'First to make a horizontal or vertical line of their selection wins'
  space
end

game = Game.new(player1, player2)
WINNING_COMBINATION = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 5], [1, 4, 6], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

# #gets player names

def player_names
  players = []
  2.times do |i|
    name = ''
    loop do
      space
      puts "player #{i + 1} please Enter Your Name"
      space
      name = gets.chomp.upcase
      break if name.length > 0 
      puts 'Invalid Entry'
    end
    puts "Welcome #{name} :"
    players << name
  end
  players
end
def display_board(game.board)
  space
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

players = player_names
player1 = Player.new(players[0], 'X')
player2 = Player.new(players[1], 'O')
players = [player1, player2]
puts ''
puts '_'*50
puts "                 #{player1.name} vs #{player2.name}"
puts '                    Let the games begin'
puts '_'*50
puts ''

def restart(game, player, board)
  space
  space
  space
  puts 'Do You Want To Play Again?'
  puts 'Enter Y or N'
  loop do
    option = gets.chomp.upcase
    if option == 'Y'
      move(game, player, board)
    else
      break
    end
  end


def winner?(player, board)
  tot = []
  WINNING_COMBINATION.each do |comb|
    score = board.each_index.select{|i| board[i] == player.tag}
    tot = score & comb
    
  end
  return true if tot.length == 3
end

def restart(player, board)

  space
  space
  space
  puts 'Do You Want To Play Again?'
  puts 'Enter Y or N'
  loop do
    option = gets.chomp.upcase
    if option == 'Y'
      board[0] = 1; board[1] = 2
      board[2] = 3; board[3] = 4
      board[4] = 5; board[5] = 6
      board[6] = 7; board[7] = 8; board[8] = 9
      move(player, board)
    else
      return 
    end
  end
end

def move(player, board)
  puts 'Enter move between 1 - 9'
  puts "#{player.name} It is  your turn"
  input = game.player_input
  if game.valid?(board, input)
    board[input] = player.tag

    display_board(game.board)
    puts "#{player.name} WON!!" if winner?(player, board)
    restart(player, board) if winner?(player, board)
    # player.score << input
  elsif game.position_taken?(board, input)
    puts "Position #{board[input]} taken - Try Again"
    move(game, player, board)
  else
    puts 'Invalid Entry - Try Again'
    move(game, player, board)

  end
  return player.score
end

def play(game, players, board)
  count = 0
  while count < 9
    2.times do |i|
      players[i].score = move(players[i], board)

      # if winner?(players[i].score)
      #   puts "DBG Winner Score #{winner?(players[i].score)}"
      #   puts "#{players[i].name} HAS WON!!"
      #   return "#{players[i].name} HAS WON!!"
      # else
      #   # puts "SCore = #{players[i].score}"
      # end

    end
    puts count 
    count += 1
  end
end

play(game, players, board)