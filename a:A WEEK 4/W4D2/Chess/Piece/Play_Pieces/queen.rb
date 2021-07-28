require_relative "../piece.rb"
require_relative "Slideable.rb"
class Queen < Piece
    include Slideable
    def symbol
        return "Q"
    end 

    private
    def move_dirs
        tot = horizontal_dirs
        tot += diagonal_dirs
        tot
    end
    
end