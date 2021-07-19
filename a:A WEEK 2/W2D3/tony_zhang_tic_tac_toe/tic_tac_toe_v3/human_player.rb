class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)

        posBool = true
        numbers = "1234567891011121314151617181920"
        while posBool
            posBool = false
            p "Please enter a position by 2 numbers with a space in between like this - >> [ 0 2 ]"
            inputs = gets.chomp
            arr = inputs.split(" ")
            
            if arr.length != 2 
                posBool = true
                puts "too many inputs, Please try again"
            elsif !numbers.include?(arr[0]) || !numbers.include?(arr[1])
                posBool = true
                puts "please enter numbers only"
            elsif !legal_positions.include?([arr[0].to_i,arr[1].to_i])
                posBool = true
                puts "that position was already chosen. Please choose another"
            end 
        end
        pos = [arr[0].to_i,arr[1].to_i]
        return pos
    end
    
end





        # while posBool
        #     posBool = false
        #   
        #     if (CONDITION)
        #         posBool = true
        #         
        #     elsif (CONDITION)
        #         posBool = true
        #         
        #     elsif (CONDITION)
        #         posBool = true
        #         
        #     end 
        # end