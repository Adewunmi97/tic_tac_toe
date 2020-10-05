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
  space
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


WINNING_COMBINATION = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 5], [1, 4, 6], [2, 5, 8], [0, 4, 8], [2, 4, 5]].freeze

# #gets player names

def player_names
  players = []
  2.times do |i|
    name =''
    loop do
      space
      puts "player #{i + 1} please Enter Your Name"
      space
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
players = [player1, player2]
puts ''
puts '_'*50
puts "                 #{player1.name} vs #{player2.name}"
puts '                    Let the games begin'
puts '_'*50
puts ''


def user_input
  space
  puts 'Enter Choice between 1 and 9'
  choice = gets.chomp.strip.to_i - 1
 choice
end

def int_between_1_and_9?(input)
  input.is_a?(Integer) && input.between?(1, 9)
end

def position_taken?(board, input)
  board[input] == 'X' || board[input] == 'O' ? true : false
end

def winner?(score)
  for win in WINNING_COMBINATION
    return true if win == score
  end
end

def move(players, board)
  count = 0
  display_board(board)
  while count < 9
    2.times do |i|
      puts "#{players[i].name} it is your turn"
      choice = user_input
      if board[choice] == ('X' || 'O')
        puts 'Position taken'
        choice = user_input
      elsif !int_between_1_and_9?(choice)
        puts 'Invalid Entry'
        choice = user_input
      end
      board[choice] = players[i].tag
      players[i].score << choice
      display_board(board)
      p players[i].score
      WINNING_COMBINATION.each do |win|
        # p "Inside #{players[i].score}"
        # p win
        puts "#{players[i].name} WINS!!" if players[i].score == win
        return if players[i].score == win
      end
    end
  end
end

move(players, board)

