class Board
#############################PART 1#############################
    def initialize(num)
        # @grid = []
        # num.times do
        #     @grid << Array.new(num,:N)
        # end

        @grid = Array.new(num) { Array.new(num,:N)}
        @size = @grid.length * @grid.length
    end

    def size
        @size
    end

    def [](arr)
        @grid[arr[0]][arr[1]]
    end
    
    def []=(arr,val)
        @grid[arr[0]][arr[1]] = val
    end

    def num_ships
        arr = @grid.flatten
        arr.count(:S)
    end
#############################PART 2#############################
    def attack(pos)
        if self[pos] == :S
            self[pos]= :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos]= :X
            return false
        end
    end

    def place_random_ships
        amountShips = @size / 4
        count = 0
        while count < amountShips
            rand1 = rand(0...@grid.length)
            rand2 = rand(0...@grid.length)
            if @grid[rand1][rand2] == :N
                @grid[rand1][rand2] = :S
                count+=1
            end
        end
    end

    def hidden_ships_grid
        fake = []
        @grid.length.times do
            fake << Array.new(@grid.length,:N)
        end

        # fake = Array.new(num) { Array.new(num,:N)}

        fake.each_with_index do |arr,idx|

            arr.each_with_index do |val,idx2|

                if @grid[idx][idx2] == :S 
                    fake[idx][idx2] = :N
                else
                    fake[idx][idx2] = @grid[idx][idx2]
                end
            end
        end
        return fake
    end





    def self.print_grid(bigArr)
        bigArr.each_with_index do |arr,idx1|
            puts arr.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end


end