def proper_factors(num)
    count = num - 1
    arr = []
    while count > 0
        if num % count == 0
            arr << count
        end
        count -=1
    end
    arr
end

def aliquot_sum(num)
    return proper_factors(num).sum()
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(num)
    array = []
    val = 1
    while array.length < num
        val +=1
        if perfect_number?(val)
            array << val
        end
    end
    array
end