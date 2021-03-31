#!/usr/bin/env ruby

require 'tty-box'
require_relative '../lib/player'
require_relative '../lib/board'

i = 0

def new_game
  system 'clear'
  system 'cls'
  system 'bin/main.rb'
  exit
end

def end_game
  system 'clear'
  system 'cls'
  exit
end

def play_again
  puts "Press 'yes' if you want to play another game and 'no' if you don't"
  answer = gets.chomp
  return new_game if answer == 'yes'

  end_game
end

puts "Welcome to the Ruby's Tic-Tac-Toe Game!\n"

puts "Enter the first player's name:"
player1 = Player.new(gets.chomp, 'X')

puts "Enter the second players's name:"
player2 = Player.new(gets.chomp, 'O')

players = [player1, player2]

puts "#{player1.player[:name]} is going to play as #{player1.player[:mark]} " \
"and #{player2.player[:name]} is going to play as #{player2.player[:mark]}!"

puts "Let's start! (Press ENTER)"

gets

system 'clear'
system 'cls'

board = Board.new

def tie
  puts TTY::Box.frame "IT'S A TIE!\nGame Over", padding: 2, align: :center
end

def win(player, board)
  puts board.draw_the_board
  puts TTY::Box.frame "#{player.player[:name]} you WIN the game!\n", padding: 2
end

while i < 9
  puts board.draw_the_board
  player = players[i % 2]
  puts "It's #{player.player[:name]}'s turn!\n"

  puts 'Please select an available cell from the board.'
  received_number = ''
  until (1..9).include?(received_number) && !board.whole_moves.include?(received_number)
    received_number = gets.chomp.to_i
    puts 'Invalid move. Please enter a number from 1-9.' unless (1..9).include?(received_number)
    if board.whole_moves.include?(received_number)
      puts 'Invalid move. This number has been already chose, choose new number.'
    end
  end
  player.add_moves(received_number)
  board.add_moves(received_number)
  board.grid[received_number - 1] = player.player[:mark]
  puts "this the value #{board.grid[received_number - 1]}"
  system 'clear'
  system 'cls'

  i += 1

  if board.check_winner(player.player_moves)
    win(player, board)
    play_again
  end

end

if i == 9
  puts board.draw_the_board
  board.check_winner(player.player_moves) ? win(player, board) : tie
  play_again
end
