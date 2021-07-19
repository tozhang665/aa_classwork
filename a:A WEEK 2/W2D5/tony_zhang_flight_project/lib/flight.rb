class Flight

    attr_reader :passengers

    def initialize(str,num)
        @flight_number = str
        @capacity = num
        @passengers = []
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(pass)
        if pass.has_flight?(@flight_number)
            if !full?
                @passengers << pass
            end
        end
    end

    def list_passengers
        names = []
        @passengers.each do |pass|
            names << pass.name
        end
        names
    end

    def [](num)
        @passengers[num]
    end

    def <<(pass)
        board_passenger(pass)
    end
end