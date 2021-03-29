class Player
    attr_reader :name, :player_moves

    def initialize(name)
        @name = name
        @player_moves = []
    end

    def add_moves(move_number)
        @player_moves << move_number
    end
end

