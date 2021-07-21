#########warm up###########

def rec_range(num1,num2)
    return [] if num2 < num1
    return [num1] if num1 == num2-1
    tot = []
    tot += [num1]
    tot += rec_range(num1+1,num2)
    tot
end

def iter_range(num1,num2)
    arr = (num1...num2).to_a
    arr
end

# p iter_range(1,7)

# p rec_range(1,7)


def exp(b,num)
    return b if num == 1
    b*exp(b,num-1)
end

def exp2(b,num)
    return 1 if num == 0
    return b if num == 1
    if num % 2 == 0
        exp2(b,num/2) * exp2(b,num/2)
    else
        b*(exp2(b, (num-1)/2) *(exp2(b, (num-1)/2)))
    end
end

# p exp(2,9)
# p exp2(2,8)

class Array
    def deep_dup
        dup = []
        self.each do |ele|
            if ele.is_a?(Array)
                dup << ele.deep_dup
            else
                dup << ele
            end
        end
        dup
    end
end

# # arr = [[1,2,3],[4,5,6]]
# arr = ['a', 'b', ['c']]
# #for 'a' shovel 'a' directly into a new array
# #for 'b' shovel 'b' directyly into same spot
# #for index 2
# d = arr.deep_dup

# p d

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.deep_dup

# # shouldn't modify robot_parts
# p robot_parts_copy[1] << "LEDs"
# # but it does
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]


def rec_fibonacci(n)
    return nil if n == 0
    return 1 if n == 1
    return 1 if n == 2
    arr = [1,1]
    rec_fibonacci(n-1) + rec_fibonacci(n-2)
end


def iter_fibonacci(n)
    return nil if n < 1
    return [1] if n == 1
    return [1,1] if n == 2
    arr = [1,1]
    while arr.length < n
        arr << arr[-1] + arr[-2]
    end
    arr
end

# p rec_fibonacci(10)
# p iter_fibonacci(10)

def bsearch(arr,target)
    return nil if arr.length == 0
    if arr[-1] == target
        return arr.length-1
    else
        bsearch(arr[0..-2],target)
    end
end


# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil



def sort(arr)
    if arr.length == 1
        return arr
    end
    half = arr.length / 2
    left = arr.take(half)
    right = arr.drop(half)
    brokenLeft = sort(left)
    brokenRight = sort(right)
    merge(brokenLeft,brokenRight)
end


def merge(leftSide,rightSide)

    if leftSide.empty?
        return rightSide
    elsif rightSide.empty?
        return leftSide
    end

    if rightSide[0] < leftSide[0]
        smallest = rightSide.shift
    else
        smallest = leftSide.shift
    end
    [smallest].concat(merge(leftSide,rightSide))
end



# arr = [12, 11, 13, 5,7,40,1,2,3,541,23,3123,54,1231]

# p sort(arr)



def subsets(arr)
    return [[]] if arr.length == 0
    return [arr[0]] if arr.length == 1
    tot = []
    tot << arr[0]
    tot << subsets(arr[1...-1])
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# def permutations(arr)

# end