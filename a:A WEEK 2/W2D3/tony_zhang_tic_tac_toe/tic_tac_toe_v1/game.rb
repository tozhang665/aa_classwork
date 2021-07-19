require_relative "human_player.rb"
require_relative "board.rb"

class Game
    def initialize(player_1_mark,player_2_mark)
        @player1 = HumanPlayer.new(player_1_mark)
        @player2 = HumanPlayer.new(player_2_mark)
        @currentPlayer = @player1
        @board = Board.new
    end
    def switch_turn
        if @currentPlayer == @player1
            @currentPlayer = @player2
        else
            @currentPlayer = @player1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            print "Move is :" 
            p @currentPlayer.mark
            pos = @currentPlayer.get_position
            @board.place_mark(pos,@currentPlayer.mark)
            if @board.win?(@currentPlayer.mark)
                @board.print
                print "victory belongs to "
                p @currentPlayer.mark
                return 0
            else
                self.switch_turn
            end
        end
        print "Game is a DRAW"

    end
end