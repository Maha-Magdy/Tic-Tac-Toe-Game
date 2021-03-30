#!/usr/bin/env ruby

require 'tty-box'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

puts "Welcome to the Ruby's Tic-Tac-Toe Game!\n"

puts "Enter the first player's name:"
player1 = Player.new(gets.chomp)

puts "Enter the second players's name:"
player2 = Player.new(gets.chomp)

players = [player1, player2]

puts "#{player1.name} is going to play as X and #{player2.name} is going to play as O!"

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

board = Board.new
i = 0
while i < 9

  puts box

  player = players[i % 2]
  puts "It's #{player.name}'s turn!\n"

  puts 'Please select an available cell from the board.'
  received_number = ''
  until (1..9).include?(received_number) && !board.whole_moves.include?(received_number)
    received_number = gets.chomp.to_i
    puts 'Invalid move. Please enter a number from 1-9.' unless (1..9).include?(received_number)
    puts 'Invalid move. This number has been already chose, choose new number.' if board.whole_moves.include?(received_number)
  end
  player.add_moves(received_number)
  board.add_moves(received_number)
  system 'clear'
  system 'cls'

=begin
  if i == rand(9)
    puts box
    win(player.name)
    break
  end
=end
  i += 1

  if board.check_winner(player.player_moves)
    puts "#{player.name} WINS!!!" 
    break
  end

end

if i == 9
  puts box
  tie
end

puts "board #{board.whole_moves}"
puts "player1 #{player1.player_moves}"
puts "player2 #{player2.player_moves}"
