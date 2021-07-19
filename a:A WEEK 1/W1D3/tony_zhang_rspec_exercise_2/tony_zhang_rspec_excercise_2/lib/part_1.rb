def partition(arr,num)
    greater = []
    less = []
    arr.each{|val|
        if val >= num
            greater << val
        else
            less << val
        end
    }
    [less,greater]
end

def merge(hash1,hash2)
    my_hash = Hash.new(0)
    hash1.each{|key,value|
        my_hash[key] = value
    }
    hash2.each{|key,value|
        my_hash[key] = value
    }
    my_hash
end

def censor(str,arr)
    loweredWords = str.downcase.split(" ")
    words = str.split(" ")
    loweredWords.each_with_index do |word,idx|
        if arr.include?(word)
            words[idx] = vowelreplace(words[idx])
        end
    end
    words.join(" ")
end

def vowelreplace(word)
    vowels = "aeiouAEIOU"
    word.each_char.with_index{|char,idx|
        if vowels.include?(char)
            word[idx] = "*"
        end
    }
    word
end

def power_of_two?(num)
    if num == 1
        return true
    end
    val = 2
    while val < num
        val *=2
        if val == num
            return true
        end
    end
    false
end

