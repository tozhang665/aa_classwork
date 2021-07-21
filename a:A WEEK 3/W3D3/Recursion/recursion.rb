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


def sort(numbers)
    if numbers.size <= 1
      return numbers
    end
    array_size   = numbers.size
    half_of_size = (array_size / 2).round

    left_array  = numbers.take(half_of_size)
    right_array = numbers.drop(half_of_size)
    p "slitting up into parts"
    p left_array
    p right_array
    sorted_left_array = sort(left_array)
    sorted_right_array = sort(right_array)
    p "this is left"
    p sorted_left_array
    p "this is right"
    p sorted_right_array
    merge(sorted_left_array, sorted_right_array)
  end
  # This then creates a new array, loops through the left/right arrays and places the lowest number into the array. 
  def merge(left_array, right_array)
    if right_array.empty?
      return left_array # We have nothing to compare. Left wins.
    end

    if left_array.empty?
      return right_array # We have nothing to compare. Right wins.
    end

    smallest_number = if left_array.first <= right_array.first
      left_array.shift
    else
      right_array.shift
    end

    # We keep doing it until the left or right array is empty.
    recursive = merge(left_array, right_array)

    # Okay, either left or right array are empty at this point. So we have a result.
    [smallest_number].concat(recursive)
  end


# arr = [12, 11, 13, 5, 6, 7,3]

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