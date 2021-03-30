class Player
    attr_reader :name, :player_moves, :mark, :player
    @@marks = ["X", "O"]

    def initialize(name)
        @player = {name: name, mark: @@marks.shift}
        @player_moves = []
    end

    def add_moves(move_number)
        @player_moves << move_number
    end
end

