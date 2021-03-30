class Player
  attr_reader :name, :player_moves, :mark, :player

  def initialize(name, mark)
    @player = { name: name, mark: mark }
    @player_moves = []
  end

  def add_moves(move_number)
    @player_moves << move_number
  end
end
