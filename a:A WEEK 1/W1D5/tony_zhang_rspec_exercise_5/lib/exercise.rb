def zip(*bigArr)
    # tot = []
    # bigArr.each do |arr|
    #     tot << arr
    # end
    bigArr.transpose
end

def prizz_proc(arr,proc1,proc2)
    my_arr = []
    arr.each do |ele|
        if proc1.call(ele) && !proc2.call(ele) || !proc1.call(ele) && proc2.call(ele)
            my_arr << ele
        end
    end
    my_arr
end

def zany_zip(*bigArr)
    max_length = 0
    bigArr.each do |arr|
        if arr.length > max_length
            max_length = arr.length
        end
    end
    bigArr.each_with_index do |arr,idx|
        while arr.length < max_length
            arr << nil
        end
        bigArr[idx] = arr
    end
    bigArr.transpose
end

def maximum(arr,&block)
    if arr.length == 0
        return nil
    end
    greatestIdx = 0
    arr.each_with_index do |ele,idx|
        if proc.call(ele) >= proc.call(arr[greatestIdx])
            greatestIdx = idx
        end
    end
    arr[greatestIdx]
end


def my_group_by(arr,&block)
    hash = Hash.new()
    arr.each do |val|
        hash[block.call(val)] = []
    end
    arr.each do |word|
        hash[block.call(word)] << word
    end
    hash
end


def max_tie_breaker(array,proc,&block)
    if array.length == 0
        return nil
    end
    greatest = [array[0]]
    array.each_with_index do |ele,idx|
        
        if (block.call(ele) == block.call(greatest[-1])) && idx != 0
            greatest << ele
        elsif block.call(ele) > block.call(greatest[-1])
            greatest = [array[idx]]
        end
    end
    return greatest[0] if greatest.length == 1

    evenGreater = [greatest[0]]
    greatest.each_with_index do |ele,idx|
        if ((proc.call(ele)) == proc.call(evenGreater[-1])) && idx != 0
            evenGreater << ele
        elsif proc.call(ele) > proc.call(evenGreater[-1])
            evenGreater = greatest[idx]
        end
    end
    evenGreater[0]
end




def silly_syllables(str)
    words = str.split(" ")
    vowels = "aeiou"


    words.each_with_index do |word,idx|
        
        vowelIdx = []

        word.each_char.with_index do |char,idx2|
            if vowels.include?(char)
                vowelIdx << idx2
            end
        end

        if vowelIdx.length > 1
            start = vowelIdx[0]
            last = vowelIdx[-1]
            words[idx] = word.slice(start..last)
        else
            words[idx] = word
        end

    end

    words.join(" ")

end






