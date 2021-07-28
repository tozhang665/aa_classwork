require_relative "../piece.rb"
class Pawn < Piece
    def symbol
        return "P"
    end
    
    #depending on color, [dx,dy]  black [0,1] ,
        #                             white [0,-1]
        # attacks           [dx,dy]  black [-1,1] top left
        #                            black [1,1] top right
                                    # white [ -1,-1] bottom 
    def moves
        valid_moves_array = []

        cur_x,cur_y = @pos
        ###########ONE-MOVE############
        if @color == :black
            #[0  ,  1]
            new_y = cur_y + 1
            #[0  ,  2]
            if @board[[cur_x,new_y]].is_a?(NullPiece)
                valid_moves_array << [cur_x,new_y]
            end
        elsif @color == :white
            #[0  ,  7]
            new_y = cur_y - 1
            #[0  ,  6]
            if @board[[cur_x,new_y]].is_a?(NullPiece)
                valid_moves_array << [cur_x,new_y]
            end
        end
        ###########JUMP-MOVE###############
        if cur_y == 1 && @color == :black
            new_y = cur_y + 2

            if @board[[cur_x,new_y]].is_a?(NullPiece)
                valid_moves_array << [cur_x,new_y]
            end
        elsif cur_y == 6 && color == :white
            new_y = cur_y - 2

            if @board[[cur_x,new_y]].is_a?(NullPiece)
                valid_moves_array << [cur_x,new_y]
            end

        end

        ###########ATTACKS####################


        if color == :black
           # [-1,1]   [1,1]
           new_x = cur_x - 1
           new_y = cur_y + 1

            if !@board[[new_x,new_y]].is_a?(NullPiece) && @board[[new_x,new_y]].color != @color
                valid_moves_array << [cur_x,new_y]
            end

            new_x = cur_x + 1
            new_y = cur_y + 1

            if !@board[[new_x,new_y]].is_a?(NullPiece) && @board[[new_x,new_y]].color != @color
                valid_moves_array << [cur_x,new_y]
            end

        elsif color == :white
            # [-1,-1]   [1,-1]
           new_x = cur_x - 1
           new_y = cur_y - 1

            if !@board[[new_x,new_y]].is_a?(NullPiece) && @board[[new_x,new_y]].color != @color
                valid_moves_array << [cur_x,new_y]
            end
            new_x = cur_x + 1
            new_y = cur_y - 1
            if !@board[[new_x,new_y]].is_a?(NullPiece) && @board[[new_x,new_y]].color != @color
                valid_moves_array << [cur_x,new_y]
            end
        end

         valid_moves_array
        #@color,   @board,  @pos
        #[1,0] - > [2,0]

        #[4,0]  -> [5,0]
        # current_pos = @pos
        # current_x, current_y = current_pos
        # end_pos = end_x,end_y
        # valid = true
        # while valid
        #     if current_x == end_x && end_y - current_y == 
        # end



        # @board.grid.each do |row|
        #     row,col
        # end
       
    end
end