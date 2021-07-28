require_relative "../Piece/Play_Pieces/NullPiece.rb"
require_relative "../Piece/Play_Pieces/rook.rb"
require_relative "../Piece/Play_Pieces/knight.rb"
require_relative "../Piece/Play_Pieces/bishop.rb"
require_relative "../Piece/Play_Pieces/queen.rb"
require_relative "../Piece/Play_Pieces/king.rb"
require_relative "../Piece/Play_Pieces/pawn.rb"
require 'colorize'

class Board
    attr_accessor :grid
    def initialize
        @grid = Array.new(8){Array.new(8,NullPiece.instance)}
        populate
    end
    def populate
        @grid.each_with_index do |row,rowIDX|
            if rowIDX == 1
                row.each_with_index do |col,colIDX|
                    @grid[rowIDX][colIDX] = Pawn.new(:black,self,[rowIDX,colIDX])
                end
            elsif rowIDX == 6
                row.each_with_index do |col,colIDX|
                    @grid[rowIDX][colIDX] = Pawn.new(:white,self,[rowIDX,colIDX])
                end
            end
        end


        #bottom left == [0,0]
        #top right == [7,7]
        # grid <-> pieces
        @grid[0][0] = Rook.new(:black,self,[0,0])
        @grid[0][1] = Knight.new(:black,self,[0,1])
        @grid[0][2] = Bishop.new(:black,self,[0,2])
        @grid[0][3] = Queen.new(:black,self,[0,3])
        @grid[0][4] = King.new(:black,self,[0,4])
        @grid[0][5] = Bishop.new(:black,self,[0,5])
        @grid[0][6] = Knight.new(:black,self,[0,6])
        @grid[0][7] = Rook.new(:black,self,[0,7])

        @grid[7][0] = Rook.new(:white,self,[7,0])
        @grid[7][1] = Knight.new(:white,self,[7,1])
        @grid[7][2] = Bishop.new(:white,self,[7,2])
        @grid[7][3] = Queen.new(:white,self,[7,3])
        @grid[7][4] = King.new(:white,self,[7,4])
        @grid[7][5] = Bishop.new(:white,self,[7,5])
        @grid[7][6] = Knight.new(:white,self,[7,6])
        @grid[7][7] = Rook.new(:white,self,[7,7])

        # @grid.each_with_index do |row,rowIDX|
        #     row.each_with_index do |col,colIDX|
        #         @grid[rowIDX][colIDX] = Piece.new
        #     end
        # end
        ###########WHITE############




        ############BLACK###############
        @grid = @grid.transpose
    end

    def [](pos) #[0 3] [3,0]
        @grid[pos[0]][pos[1]]
    end
    def []=(pos,val)
        @grid[pos[0]][pos[1]] = val
    end
    def move_piece(start_pos,end_pos)
        grabbed_piece = self[start_pos]
        self[start_pos] = NullPiece.instance
        self[end_pos] = grabbed_piece

        # self[start_pos],self[end_pos] = self[end_pos],self[start_pos]
    end

    def render
        grid2 = @grid.transpose
        grid2.each do |row|
            arr = []
            row.each do |sym|
                if sym.color == :white
                    print sym.symbol.colorize(:WHITE) + " "
                elsif sym.color == :black
                    print sym.symbol.colorize(:blue) + " "
                else
                    print sym.symbol.colorize(:WHITE) + " "
                end
            end
            puts " "
        end
    end
end