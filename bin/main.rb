#!/usr/bin/env ruby

puts "Welcome to the Ruby's Tic-Tac-Toe Game!"

puts "Enter the first player's name:"
player1 = gets.chomp

puts "Enter the second players's name:"
player2 = gets.chomp

puts "#{player1} is going to play as X and #{player2} is going to play as O!"

puts "Let's start! (Press ENTER)"

gets

system "clear"
system "cls"

board = "+---+

