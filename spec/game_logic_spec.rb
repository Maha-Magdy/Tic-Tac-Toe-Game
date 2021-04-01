require './lib/board'

describe Board do
    describe "#check_winner" do
        board = Board.new
        it "return true if player wins" do
            expect(board.check_winner([3, 5, 7])).to be true
        end
        it "return false if player don't have the numbers to win" do
            expect(board.check_winner([3, 5, 6])).to be false
        end
    end
end