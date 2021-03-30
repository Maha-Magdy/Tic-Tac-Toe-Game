#!/usr/bin/env ruby

require 'tty-box'

puts "Welcome to the Ruby's Tic-Tac-Toe Game!\n"

puts "Enter the first player's name:"
player1 = ''
while player1.empty?
  player1 = gets.chomp
  puts 'Invalid name. Name must not be empty' if player1.empty?
end

puts "Enter the second players's name:"
player2 = ''
while player2.empty?
  player2 = gets.chomp
  puts 'Invalid name. Name must not be empty' if player2.empty?
end

players = [player1, player2]

puts "#{player1} is going to play as X and #{player2} is going to play as O!"

puts "Let's start! (Press ENTER)"

gets

system 'clear'
system 'cls'

box = TTY::Box.frame '+---+---+---+',
                     '| 1 | 2 | 3 |',
                     '+---+---+---+',
                     '| 4 | 5 | 6 |',
                     '+---+---+---+',
                     '| 7 | 8 | 9 |',
                     '+---+---+---+',
                     padding: 1, align: :center

def tie
  puts "IT'S A TIE!\n"
  puts 'Game Over'
end

def win(player)
  puts "#{player} you WIN the game!"
end

i = 0
while i < 9

  puts box

  player = players[i % 2]
  puts "It's #{player}'s turn!\n"

  puts 'Please select an available cell from the board.'
  received_number = ''
  until (1..9).include?(received_number)
    received_number = gets.chomp.to_i
    puts 'Invalid move. Please enter a number from 1-9.' unless (1..9).include?(received_number)
  end

  system 'clear'
  system 'cls'

  if i == rand(9)
    puts box
    win(player)
    break
  end

  i += 1
end

if i == 9
  puts box
  tie
end
