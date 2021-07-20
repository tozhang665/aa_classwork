require_relative "Board.rb"

class Game
  def initialize
    @board = Board.new
    @board.populate
  end

  def play
    won = false
    while !won
      @board.conceal
      @board.render
      guessed_POS = make_guess
      @board.reveal(guessed_POS)
      @board.render
      previous_guess = guessed_POS
      guessed_POS = make_guess
      @board.reveal(guessed_POS)
      @board.render
        if @board.at(guessed_POS) == @board.at(previous_guess)
          puts "Congratulations you picked a match"
          won = true
          sleep(10)
        elsif @board.won?
          puts "all cards have been shown"
          sleep(10)
          won = true
        else
          puts "chosen cards are wrong!"
          puts "please try again"
          sleep(2)
        end
    end
  end

  def make_guess
    puts "User please make an input"
    temp = gets.chomp.split(" ")
    pos = [temp[0].to_i , temp[1].to_i]
    return pos
  end
end


g = Game.new
g.play