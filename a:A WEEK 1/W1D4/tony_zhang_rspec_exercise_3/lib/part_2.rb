def element_count(arr)
    hash = Hash.new(0)
    arr.each do |val|
        hash[val] +=1
    end
    hash
end

def char_replace!(str,hash)
    str.each_char.with_index do |char,idx|
        if hash.has_key?(char)
            str[idx] = hash[char]
        end
    end
end

def product_inject(arr)
    arr.inject{|acc,ele| acc * ele}
end
