#!/usr/bin/env ruby

require "tty-box"

puts "Welcome to the Ruby's Tic-Tac-Toe Game!"

puts "Enter the first player's name:"
player1 = gets.chomp

puts "Enter the second players's name:"
player2 = gets.chomp

players = [player1, players2]

puts "#{player1} is going to play as X and #{player2} is going to play as O!"

puts "Let's start! (Press ENTER)"

gets

box = TTY::Box.frame "+---+---+---+",
                     "| 1 | 2 | 3 |", 
                     "+---+---+---+",
                     "| 4 | 5 | 6 |", 
                     "+---+---+---+",
                     "| 7 | 8 | 9 |", 
                     "+---+---+---+",
                     padding: 1, align: :center

i = 0
while i < 9
  system "clear"
  system "cls"
  
  player = players[1 % 2] 

  puts box
  puts "It's #{player}'s turn!\n" 
  puts "Please select an available cell from the board."
  received_number = gets.chomp
  puts "Invalid move. Please enter a number from 1-9." unless received_number.is_a?(Number)
  
  

  i += 1
end

tie

def tie
  puts "IT'S A TIE!\n"
  puts "Game Over"
end

def win(player)
  puts "#{player} you WIN the game!"
end

