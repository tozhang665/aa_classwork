require_relative "../piece.rb"
require_relative "Slideable.rb"
class Bishop < Piece
    include Slideable
    def symbol
        return "B"
    end
    private
    def move_dirs
        diagonal_dirs
    end
    
end