class Room

    ##############################PART 0##############################
    def initialize(num)
        @capacity = num
        @occupants = []        
    end

    def capacity
        @capacity
    end
    def occupants
        @occupants
    end

    def full?
        @occupants.length == @capacity
    end
    
    def available_space
        @capacity - @occupants.length
    end
    
    def add_occupant(name)
        if full? 
            return false
        else
            @occupants << name
            return true
        end
    end

end
