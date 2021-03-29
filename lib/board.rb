class Board
   attr_reader :whole_moves
   @@win = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7],
   ]

   def initialize
     @whole_moves = []
   end

   def add_moves(move_number)
      @whole_moves<<move_number
   end

   def check_winner(player)
      player.each do |move|
         winner_count = 0
         @@win.each do |win_combination|
            winner_count += 1 if win_combination.include?(move)
            break if winner_count == 3
         end
         return true if winner_count == 3
         false
      end
   end
end