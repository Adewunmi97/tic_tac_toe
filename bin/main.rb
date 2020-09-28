#!/usr/bin/env ruby

# display welcome message
puts 'Welcome Ade\'s to Tic Tac Toe!'
# get player names
puts 'Please Enter Your Name '
name = gets.chomp
puts "Welcome #{name}"

# display board 
def display_board
  puts " 1 | 2 | 3 "
  puts " --------- "
  puts " 4 | 5 | 6 "
  puts " --------- "
  puts " 7 | 8 | 9 "
end

display_board
# get player move
puts "Enter your choice between 1 and 9"
choice = gets.chomp
