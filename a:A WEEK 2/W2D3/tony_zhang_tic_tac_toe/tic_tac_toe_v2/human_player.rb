class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        p "Please enter a position by 2 numbers with a space in between like this - >> [ 0 2 ]"
        inputs = gets.chomp
        arr = inputs.split(" ")
        
        if arr.length != 2 
            getBool = true
            raise "sorry that was invalid"
        end 
        pos = [arr[0].to_i,arr[1].to_i]
        return pos
    end
    
end