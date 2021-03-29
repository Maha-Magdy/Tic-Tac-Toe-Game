class Board
   attr_reader :whole_moves

   def initialize
     @whole_moves = []
   end

   def add_moves(move_number)
      @whole_moves<<move_number
   end
end