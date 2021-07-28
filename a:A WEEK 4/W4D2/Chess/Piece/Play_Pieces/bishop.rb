require_relative "../piece.rb"
require_relative "Slideable.rb"
class Bishop < Piece
    include Slideable
    def symbol
        return "b"
    end
    private
    def move_dirs
        @DIAGONAL_DIRS
    end
    
end