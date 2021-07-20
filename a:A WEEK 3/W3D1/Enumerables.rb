
class Array
    def my_each(&prc)
        i = 0
        arr = []
        while i < self.length
            arr << prc.call(self[i])
            i += 1
        end

        if arr.include?(nil)
            return self
        else
            return arr
        end

    end


    def my_select(&prc) 
        boolArr = self.my_each(&prc)
        arr = []
        boolArr.each_with_index do |bool,idx|
            if bool == true
                arr << self[idx]
            end
        end
        arr
    end

    def my_reject(&prc)
        arr = []
        self.each do |ele|
            if !prc.call(ele)
                arr << ele
            end
        end
        return arr
    end

    def my_any?(&prc)
        self.each {|ele| return true if prc.call(ele)}
        return false
    end

    def my_all?(&prc)
        self.each {|ele| return false if !prc.call(ele)}
        return true
    end


    def my_flatten
        return [self] if !self.is_a?(Array)
        arr = []
        self.each do |el| 
            if el.is_a?(Array)
                arr += el.my_flatten
            else
                arr += [el]
            end
        end
        arr
    end

    def my_zip(*args)
        bigArr = []
        self.each_with_index do |ele,idx|
            smallArr = []
            smallArr << self[idx]
            args.each do |arr|
                smallArr << arr[idx]
            end
            bigArr << smallArr
        end
        bigArr
    end


    def my_rotate(num = 1)
        self.rotate(num)
    end

    def my_join(token = "")
        str = ""
        self.each do |ele|
            str+=ele
            str+=token
        end
        str
    end

    def my_reverse
        arr = []
        num = self.length-1
        while num >= 0
            arr << self[num]
            num -=1
        end
        arr
    end

end


# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]




# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


# def flatten(data)
#     # if data.is_a? String
#     #     return data
#     # end
    
#     return [data] if !data.is_a?(Array)
#     flattened = []
#     data.each { |el| flattened += flatten(el)} 
#     flattened

# end



# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # # => 1
# #      2
# #      3
# #      1
# #      2
# #      3

# p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]


