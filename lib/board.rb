require 'tty-box'

class Board
  attr_reader :whole_moves, :grid, :box

  def initialize
    @whole_moves = []
    @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @win = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7]
    ]
  end

  def add_moves(move_number)
    whole_moves << move_number
  end

  def check_winner(player_moves)
    @win.each do |win_combination|
      winner_count = 0
      win_combination.each do |move|
        winner_count += 1 if player_moves.include?(move)
      end
      return true if winner_count == 3
    end
    false
  end

  def draw_the_board
    @box = TTY::Box.frame '+---+---+---+',
                          "| #{@grid[0]} | #{@grid[1]} | #{@grid[2]} |",
                          '+---+---+---+',
                          "| #{@grid[3]} | #{@grid[4]} | #{@grid[5]} |",
                          '+---+---+---+',
                          "| #{@grid[6]} | #{@grid[7]} | #{@grid[8]} |",
                          '+---+---+---+',
                          padding: 1, align: :center
  end
end
