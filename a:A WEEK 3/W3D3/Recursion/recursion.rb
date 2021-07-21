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
        self.each do |smallArr|
            section = Array.new(smallArr.length)
            dup << section
        end
        dup[1][1] = 10
        dup
    end

end

# arr = [[1,2,3],[4,5,6]]

# d = arr.deep_dup

# p d


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


