require "byebug"

def strange_sums(arr)
    count = 0
    arr.each_with_index{|val,idx|
        arr[idx..-1].each_with_index{|val2,idx2|
            if val + val2 == 0
                count+=1
            end
        }
    }
    count
end

def pair_product(arr,num)
    arr.each_with_index{|val,idx|
        arr[idx+1..-1].each_with_index{|val2,idx2|
            if val * val2 == num
                return true
            end
        }
    }
    false
end

def rampant_repeats(str,hash)
    chars = str.split("")
    chars.each_with_index do |char,idx|
        if hash.has_key?(char)
            chars[idx] = char * hash[char]
        end
    end
    chars.join("")
end

def perfect_square(num)
    result = 0
    count = 0
    while result < num
        count += 1
        result = count * count
        if result == num
            return true
        end
    end
    false
end

def anti_prime?(num)
    counter = Hash.new(0)
    (1..num).each do |val|
        counter[val] = factorCount(val)
    end
    arr = counter.sort_by{|k,v| v}
    if arr[-1][0] == num
        return true
    else
        return false
    end
end
def factorCount(num)
    count = 0
    (1..num).each do |val|
        if num%val == 0
            count+=1
        end
    end
    count
end

def matrix_addition(arr1,arr2)
    result = []
    arr1.each_with_index do
        |big,idx|
        current = []
        big.each_with_index do
            |small,idx2|
            current << small + arr2[idx][idx2]
        end
        result << current
    end
    result
end

def mutual_factors(*nums)
    commonFactors = (1..nums.min).to_a
    deleteFactors = []
    nums.each do |num|
        commonFactors.each do |factor|
            if num % factor != 0
                deleteFactors << factor
            end
        end
    end
    deleteFactors.each do |val|
        commonFactors.delete(val)
    end
    commonFactors
end

def tribonacci_number(num)
    if num == 1 || num == 2
        return 1
    end
    if num == 3 
        return 2
    end
    base = [1,1,2]
    while base.length < num
        base << base[-1] + base[-2] + base[-3]
    end
    base[-1]
end

def matrix_addition_reloaded(*arrays)


    if arrays.length == 1
        return arrays[0]
    end


    length = arrays[0].length
    arrays.each do |array|
        if array.length !=length
            return nil
        end
    end



    arrays.inject do |acc,el|
        matrix_addition(acc,el)
    end



end

def squarocol?(bigArr)

    bigArr.each do |smallArray|
        if smallArray.uniq.size <= 1
            return true
        end
    end


    bigArr = flipArray(bigArr)

    bigArr.each do |smallArray|
        if smallArray.uniq.size <= 1
            return true
        end
    end
    return false
end

def squaragonal?(bigArr)
    diagonal = []
    (0...bigArr.length).each do |val|
        diagonal << bigArr[val][val]
    end
    if diagonal.uniq.size <= 1
        return true
    end
    diagonal = []
    (0...bigArr.length).each do |val|
        diagonal << bigArr[val][bigArr.length - 1 - val]
    end
    if diagonal.uniq.size <= 1
        return true
    end
    return false

end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false
# # check

# # 0 0
# # 1 1
# # 2 2

# # 0 2
# # 1 1
# # 2 0

def flipArray(arr)
    flipArr = []
    bigLen = arr.length
    smallLen = arr[0].length
    (0...smallLen).each do |bigVal|
        current = []
        (0...bigLen).each do |smallVal|
            current << arr[smallVal][bigVal]
        end
        flipArr << current
    end
    flipArr
end

def pascals_triangle(num)
    if num == 1
        return [[1]]
    elsif num == 2
        return [[1,1]]
    end
    base = [[1],[1,1]]
    while base.length < num
        copy = base[-1]
        current = [1]
        (1...copy.length).each do |val|
            current << copy[val] + copy[val-1]
        end
        current << 1
        base << current
    end
    base
end

def mersenne_prime(num)
    mersenne_list = []
    number = 2
    tester = 0
    while mersenne_list.length < num
        number = number * 2
        tester = number - 1
        if primeCheck(tester)
            mersenne_list << tester
        end
    end
    mersenne_list[-1]
end


def primeCheck(num)
    if num < 2
        return false
    end
    (2...num).each do |val|
        if num % val == 0
            return false
        end
    end
    true
end

def triangular_word?(str)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    count = 0
    str.each_char do |char|
        count += (alphabet.index(char)+1)
    end
    numCheck(count)
    
end
def numCheck(num)
    (1..num).each do |val|
        count = val + 1
        count = count * val
        count = count / 2
        if count == num
            return true
        end
    end
    return false
end

def consecutive_collapse(arr)
    collapsable = true

    while collapsable
        collapsable = false
        (1...arr.length).each do |val|
            if rangeCheck(arr[val],arr[val-1])
                arr.delete_at(val)
                arr.delete_at(val-1)
                collapsable = true
                break
            end 
        end
    end
    arr

end

def rangeCheck(num1,num2)
    if num1 + 1 == num2 || num1 - 1 == num2
        return true
    end
    false
end


def pretentious_primes(arr,num)
    finishedArr = []
    arr.each do |val|
        current = val
        count = 0
        if num > 0
            while count < num
                current +=1
                if primeCheck(current)
                    count+=1
                end
            end
            finishedArr << current
        end

        if num < 0
            while count > num
                current -=1
                if primeCheck(current)
                    count-=1
                end
                if current < 0
                    finishedArr<<nil
                    break
                end
            end
            if current > 0
                finishedArr << current
            end
        end
    end
    finishedArr
end
