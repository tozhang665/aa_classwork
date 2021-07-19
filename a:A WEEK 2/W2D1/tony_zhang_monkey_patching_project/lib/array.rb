# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        if self.length == 0
            return nil
        end
        self.max - self.min
    end
    
    def average
        if self.length == 0
            return nil
        end

        return (self.sum*1.0)/self.length
    end

    def median
        if self.length == 0
            return nil
        end
        if self.length % 2 == 1
            arr = self.sort
            return arr[arr.length / 2]
        else
            arr = self.sort
            first = arr[(arr.length / 2) - 1]
            second = arr[(arr.length / 2)  ]
            sum = first + second
            return sum / 2.0
        end
    end

    def counts
        hash = Hash.new(0)
        self.each do |val|
            hash[val] += 1
        end
        hash
    end

    def my_count(ele)
        count = 0
        self.each do |val|
            if val == ele
                count+=1
            end
        end
        count
    end


    def my_index(ele)
        self.each_with_index do |val,idx|
            if val == ele
                return idx
            end
        end
        nil
    end

    def my_uniq
        my_arr = []
        self.each do |ele|
            if !my_arr.include?(ele)
                my_arr << ele
            end
        end
        my_arr
    end

    def my_transpose
        length = self[0].length - 1
        my_arr = []
         (0..length).each do |ele|
            inner = []
            (0..length).each do |ele2|
                inner << self[ele2][ele]
            end
            my_arr << inner
        end
        my_arr
    end
end


