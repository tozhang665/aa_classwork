module Slideable
    HORIZONATAL_DIRS = [[-1, 0], #left
    [1, 0], # right
    [0, 1], # up (vertical)
    [0, -1]  # down (vertical)
].freeze

    DIAGONAL_DIRS = [
    [-1, 1], # up + left
    [1, 1], # up + right
    [-1, -1], # down + left
    [1, -1]  # down + right
  ].freeze

    def horizontal_dirs
        HORIZONATAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        arr = []
        move_dirs.each do |direction| # [1,0]
            arr += grow_unblocked_moves_in_dir(direction[0],direction[1])
        end
        arr
    end

    def move_dirs
       raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        array_moves = []
        current_pos = @pos
        current_x, current_y = current_pos
        valid = true
        while valid
           current_x = current_x + dx 
           current_y = current_y + dy
            if (current_x > 7 || current_y > 7) || (current_x < 0 || current_y < 0)
                valid = false
                break
            end
               
            if @board[[current_x, current_y]].is_a?(NullPiece)
                array_moves << [current_x,current_y]
            elsif @board[[current_x, current_y]].color != @color
                array_moves << [current_x, current_y]
                break
            else
                break
            end            
        end
        #@board, @pos[CURRENT POSITION], @color
        return array_moves
    end
end

