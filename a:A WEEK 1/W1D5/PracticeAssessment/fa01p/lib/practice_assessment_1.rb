# Define your methods here. 

def first_letter_vowel_count(str)
    vowels = "aeiou"
    count = 0
    words = str.downcase.split(" ")
    words.each do |word|
        if vowels.include?(word[0])
            count +=1
        end
    end
    count
end

def count_true(arr,proc)
    count = 0
    arr.each do |ele|
        if proc.call(ele)
            count+=1
        end
    end
    count
end

def procformation(arr,proc1,proc2,proc3)
    arr.each_with_index do |ele,idx|
        if proc1.call(ele)
            arr[idx] = proc2.call(ele)
        else
            arr[idx] = proc3.call(ele)
        end
    end
    arr
end

def array_of_array_sum(bigArr)
    bigArr.flatten().sum()
end

def selective_reverse(str)
    vowels = "aeiou"
    words = str.split(" ")
    words.each_with_index do |word,idx|
        if vowels.include?(word[0]) || vowels.include?(word[-1])
            words[idx] = word
        else
            words[idx] = word.reverse()
        end
    end
    words.join(" ")
end

def hash_missing_keys(hash,*args)
    arr = []
    keys = hash.keys
    args.each do |ele|
        if !keys.include?(ele)
            arr << ele
        end
    end
    arr
end
