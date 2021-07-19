
class Array
    def my_each(&prc)
        i = 0

        while i < self.length
            prc.call(self[i])
            i += 1
        end
        return self
    end

    def my_select(&prc)
        arr = []
        i = 0
        while i < self.length
            if prc.call(self[i]) == true
                arr << self[i]
            end
            i += 1
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

end

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