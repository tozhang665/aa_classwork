class Piece
    attr_reader :color
    def initialize(color="",board="",pos="")
        @color = color
        @board = board
        @pos = pos
    end

    def moves 
    #     possible_pos = []
    #     length1 = @board.grid[0].length
    #     length2 = @board.grid.length
    #    (0...length1) do |i|
    #      (0...length2) do |j|
    #         if @board.grid[i][j].color != @color
    #             possible_pos << [i, j]
    #         end 
    #      end 
    #    end
    #        return possible_pos
    end

    def to_s

    end

    def empty?

    end

    def valid_moves

    end

    def pos=(val)

    end

    def symbol
        @color
    end

    def inspect
        return self.class
    end
    

    private
    def move_into_check?(end_pos)

    end
end
