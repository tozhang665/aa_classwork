# Write a method, is_sorted(arr), that accepts an array of numbers as an arg.
# The method should return true if the elements are in increasing order, false otherwise.
# Do not use the built-in Array#sort in your solution :)

def is_sorted(arr)
    reversedArr = arr.reverse
    reversedArr.each_with_index{|val,idx|
        if reversedArr[idx] == 1
            return true
        end
        if reversedArr[idx] < reversedArr[idx+1]
            return false
        end
    }
end

p is_sorted([1, 4, 10, 13, 15])       # => true
p is_sorted([1, 4, 10, 10, 13, 15])   # => true
p is_sorted([1, 2, 5, 3, 4 ])         # => false
