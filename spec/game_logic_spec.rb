require './lib/board'
require './lib/player'

describe Board do
  let(:board) { Board.new }
  describe '#check_winner' do
    it 'return true if player wins' do
      expect(board.check_winner([3, 5, 7])).to be true
    end
    it 'return false if player don\'t have the numbers to win' do
      expect(board.check_winner([3, 5, 6])).to be false
    end
  end

  describe '#add_moves' do
    it 'add the input number inside whole_moves array' do
      added_move = 5
      board.add_moves(added_move)
      expect(board.whole_moves).to include added_move
    end
    it 'the input number doesn\'t add inside whole_moves array, and returns an error' do
      expect { board.add_moves() }.to raise_error(ArgumentError)
    end
  end

  describe '#draw_the_board' do
    initial_box = TTY::Box.frame '+---+---+---+',
                                 '| 1 | 2 | 3 |',
                                 '+---+---+---+',
                                 '| 4 | 5 | 6 |',
                                 '+---+---+---+',
                                 '| 7 | 8 | 9 |',
                                 '+---+---+---+',
                                 padding: 1, align: :center

    it 'draws a tic tac toe board' do
      expect(board.draw_the_board).to eql(initial_box)
    end
  end
end

describe Player do
  let(:player) { Player.new('Maha', 'X') }
  describe '#add_moves' do
    it 'add the input number inside player_moves array' do
      player_move = 5
      player.add_moves(player_move)
      expect(player.player_moves).to include player_move
    end
    it 'the input number doesn\'t add inside player_moves array, and returns an error' do
      expect { player.add_moves() }.to raise_error(ArgumentError)
    end
  end
end
