require_relative "../piece.rb"
require_relative "Slideable.rb"
class Rook < Piece
    include Slideable
    def symbol
        return "R"
    end

    def move_dirs
        horizontal_dirs
    end
    
end