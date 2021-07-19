def my_reject(arr, &block)
    my_arr = []
    arr.each do |val|
        if !block.call(val)
            my_arr << val
        end
    end
    my_arr
end

def my_one?(arr,&block)
    my_arr = []
    arr.each do |val|
        if block.call(val)
            my_arr << val
        end
    end
    my_arr.length == 1
end


def hash_select(hash,&block)
    hash2 = Hash.new(0)
    hash.each do |k,v|
        if block.call(k,v)
            hash2[k] = v
        end
    end
    hash2
end

def xor_select(arr,proc1,proc2)
    my_arr = []
    arr.each do |val|
        bool1 = proc1.call(val)
        bool2 = proc2.call(val)
        if (bool1 && !bool2) || (!bool1 && bool2)
            my_arr << val
        end
    end
    my_arr
end

def proc_count(num,arr)
    count = 0
    arr.each do |proc|
        if proc.call(num)
            count +=1
        end
    end
    count
end