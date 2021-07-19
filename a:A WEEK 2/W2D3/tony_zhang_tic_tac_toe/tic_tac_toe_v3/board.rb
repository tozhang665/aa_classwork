class Board
    def initialize(num)
        @grid = Array.new(num){Array.new(num,"_")}
    end
    
    def valid?(arr)
        width = @grid.length
        height = @grid[0].length
        if arr[0] < 0 || arr[1] < 0
            raise "no negatives"
            return false
        end
        if arr[0] < width && arr[1] < width
            return true
        else
            return false
        end

    end

    def empty?(arr)
        if !valid?(arr)
            raise "Wrong Input"
            return false
        end
        if @grid[arr[0]][arr[1]] == "_"
            return true
        else
            return false
        end
    end

    def place_mark(pos,mark)
        if empty?(pos)
            @grid[pos[0]][pos[1]] = mark
        end
    end

    def print
        @grid.each do |arr|
            puts arr.join(" | ")
        end
    end

    def win_row?(mark)
        @grid.each do |arr|
            if arr.uniq == [mark]
                return true
            end
        end
        return false
    end

    def win_col?(mark)
        arr = @grid.transpose

        arr.each do |arrr|
            if arrr.uniq == [mark]
                return true
            end
        end
        return false
    end

    def win_diagonal?(mark)
        diagonal = []
        (0...@grid.length).each do |val|
            diagonal << @grid[val][val]
        end
        if diagonal.uniq == [mark]
            return true
        end
        diagonal = []
        (0...@grid.length).each do |val|
            diagonal << @grid[val][@grid.length - 1 - val]
        end
        if diagonal.uniq == [mark]
            return true
        end
        return false

    end
    def win?(mark)
        if win_diagonal?(mark)||win_col?(mark)||win_row?(mark)
            return true
        end
        return false
    end

    def empty_positions?
        @grid.each do |arr|
            if arr.include?("_")
                return true
            end
        end
        return false
    end

    def legal_positions
        positions = []
        @grid.each_with_index do |arr,idx|
            arr.each_with_index do |ele,idx2|
                if ele == '_'
                    positions << [idx,idx2]
                end
            end
        end
        positions
    end

end

