#!/usr/bin/env ruby

# display welcome message
puts 'Welcome to Tic Tac Toe!'
# get player names
puts 'Please Enter Your Name '
name = gets.chomp
puts "Welcome #{name}"

# display board
def display_board
  puts ' 1 | 2 | 3 '
  puts ' --------- '
  puts ' 4 | 5 | 6 '
  puts ' --------- '
  puts ' 7 | 8 | 9 '
end
# loop 9 times
display_board
# get player-1 move
puts 'Enter your choice between 1 and 9'
choice = gets.chomp
puts choice
# check if choice is between 1 and 9
# check if choice is already taken
# get the accumulated total moves for both players
# check if accumulated moves == winning combination
display_board
# get player-2 move
puts 'Enter your choice between 1 and 9'
choice = gets.chomp
puts choice
# check if choice is between 1 and 9
# check if choice is already taken
# get the accumulated total moves for both players
# break if accumulated moves == winning combination
# if accumulated moves = true
# display winner
# else display draw
