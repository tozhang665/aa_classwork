require_relative "../piece.rb"
require "singleton"
class NullPiece < Piece
    include Singleton
    def initialize(color=nil,board=nil,pos=nil)

    end
end