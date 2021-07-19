require_relative "board"
require_relative "player"
require "byebug"

class Battleship

    attr_reader :board, :player
    #attr_writer :board

    def initialize(num)
        @player = Player.new
        @board = Board.new(num)
        @remaining_misses = @board.size / 2
    end

    def start_game
        board.place_random_ships
        print board.num_ships
        print board.print
    end

    def lose?
        if @remaining_misses <= 0
            print "you lose"
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            print "you win"
            return true
        else
            return false
        end
    end
    def game_over?
        if win? || lose?
            return true
        else
            return false
        end
    end

    def turn
        pos = @player.get_move # pos = [arr]
        good = @board.attack(pos) ### false  
        @remaining_misses -= 1 if !good ## false --> true



        @board.print
        puts @remaining_misses



    end


end
