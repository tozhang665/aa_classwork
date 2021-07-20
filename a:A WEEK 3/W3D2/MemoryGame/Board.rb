require_relative "card.rb"

class Board

    #b = Board.new
    #b.populate

    def initialize
      @size = 4
      @grid = Array.new(4){Array.new(4)}
    end

    #create a card with a random letter.
    #put 2 of those cards in a random order


    def at(arr)
      @grid[arr[0]][arr[1]].token
    end

    def populate
      alphabet = ("A".."Z").to_a  
      arr = Array.new(4){Array.new(4)} #2D array
      possibleCards = []
      8.times do 
        token = alphabet.sample
        possibleCards << Card.new(token)
        possibleCards << Card.new(token)
        alphabet.delete(token)
      end
      @grid.each do |smallArr|
        smallArr.each_with_index do |ele,idx|
          cardPicked = possibleCards.sample
          smallArr[idx] = cardPicked
          possibleCards.delete(cardPicked)
        end
      end
    end

    #Render into proper format if 4x4 -- needs work for showing tokens
    #1st -- all blank
    #2nd -- 1 chosen
    #3rd -- 2 chosen 
    def render
      puts "  0 1 2 3 "
      @grid.each_with_index do |arr,idx|
        print idx.to_s + " "
        visual = []
        arr.each do |card|
          if card.show == true
            visual << card.token
          else
            visual << " "
          end
        end
        puts visual.join(" ")
      end
    end

    def won?
      @grid.each do |smallArr|
        smallArr.each do |ele|
          if ele.show == false
            return false
          end
        end
      end
      return true
    end

    def reveal(arr) # [0,3] out of the array
      @grid[arr[0]][arr[1]].reveal 
      return @grid[arr[0]][arr[1]].token
    end

    def conceal
      @grid.each do |smallArr|
        smallArr.each do |ele|
          ele.hide
        end
      end
    end
end