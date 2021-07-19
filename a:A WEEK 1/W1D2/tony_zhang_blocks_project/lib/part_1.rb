def select_even_nums(arr)
    return arr.select{|val| val % 2==0}
end

def reject_puppies(animal)
    animal.reject{|dogs| dogs["age"] <= 2}
end

def count_positive_subarrays(arr)
    return arr.count(posCheck)
end

def count_positive_subarrays(arr)
  add_arr = Proc.new do |arr|
        count = 0
        arr.each{|val| count+=val}
        if count <= 0
            false
        else
            true
        end
  end
    return arr.count(&add_arr)
end

def aba_translate(str)
    vowels = "aeiou"
    chars = str.split("")
    chars.each_with_index do |char,idx|
        if vowels.include?(char)
            chars[idx] = char + "b" + char
        end
    end
    return chars.join("")
end

def aba_array(arr)
    arr.map{|val|aba_translate(val)}
end
