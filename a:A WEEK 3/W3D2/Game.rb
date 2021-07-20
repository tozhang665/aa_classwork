require_relative "Board.rb"
require_relative "Player.rb"
require_relative "Computer.rb"


class Game
  def initialize
    @board = Board.new
    @board.populate
    @player = Player.new
    @computer = Computer.new
    @current_player = @player
    @known_cards = {}
    @matched_cards = []
  end

  def input_revealed_card(token, pos)
    @known_cards[token] = pos
  end

  def input_matched_cards(token,userPOS)
    pos = @known_cards[token]
    @matched_cards << [pos,userPOS]
    @known_cards.delete(token)
  end

  def play
    won = false
    while !won
      @board.conceal
      @board.render
      guessed_POS = @current_player.make_guess(@matched_cards,0)

      if !@known_cards.include?(@board.at(guessed_POS))
        input_revealed_card(@board.at(guessed_POS), guessed_POS)
      elsif @known_cards.values.include?(guessed_POS)

      else
        input_matched_cards(@board.at(guessed_POS),guessed_POS)
      end
   
      @board.reveal(guessed_POS)
      @board.render
      previous_guess = guessed_POS

      switch = true
      while switch
        guessed_POS = @current_player.make_guess(@matched_cards,1)
        if previous_guess != guessed_POS
          switch = false
        else
          puts "You chose the same number twice"
          sleep(2)
        end
      end

      if !@known_cards.include?(@board.at(guessed_POS))
        input_revealed_card(@board.at(guessed_POS), guessed_POS)
      elsif @known_cards.values.include?(guessed_POS)
        
      else
        input_matched_cards(@board.at(guessed_POS),guessed_POS)
      end
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
        switch_players
    end
  end

  def switch_players
    if @current_player == @player
      @current_player = @computer
    else @current_player = @player
    end
  end

  
end

g = Game.new
g.play