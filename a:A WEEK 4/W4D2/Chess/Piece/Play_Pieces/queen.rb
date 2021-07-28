require_relative "../piece.rb"
require_relative "Slideable.rb"
class Queen < Piece
    include Slideable
    def symbol
        return "q"
    end 

    private
    def move_dirs
        HORIZONATAL_DIRS + DIAGONAL_DIRS
        
    end
    
end