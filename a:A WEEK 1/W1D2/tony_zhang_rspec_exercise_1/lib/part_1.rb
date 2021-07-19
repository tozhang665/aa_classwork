def average(num1,num2)
    return (num1+num2)/2.0
end

def average_array(arr)
    total = 0
    len = arr.length * 1.0
    arr.each do |val| 
        total += val
    end
    return total / len
end

def repeat(word,num)
    tot = ""
    while num > 0
        tot+=word
        num -= 1
    end
    tot
end

def yell(term)
    tot = term.upcase
    return tot + "!"
end

def alternating_case(str)
    changed = []
    words = str.split(" ")
    term = ""
    words.each_with_index do
        |word,idx|
        if idx % 2 == 0
            term = word.upcase
        else
            term = word.downcase
        end
        changed << term 
    end
    return changed.join(" ")
end

