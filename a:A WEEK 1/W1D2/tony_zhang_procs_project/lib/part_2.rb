def reverser(str, &prc)
    prc.call(str.reverse)
end
def word_changer(str, &prc)
    words = str.split(" ")
    words.map{|word| prc.call(word)}.join(" ")
end

def greater_proc_value(num, prc1,prc2)
    val1 = prc1.call(num)
    val2 = prc2.call(num)
    return val1 if val1 > val2
    val2
end

def and_selector(arr,prc1,prc2)
    arr.select{|val| prc1.call(val)&&prc2.call(val)}
end

def alternating_mapper(arr,prc1,prc2)
    arr.each_with_index do |val,idx|
        if idx % 2 == 0
            arr[idx] = prc1.call(val)
        else
            arr[idx] = prc2.call(val)
        end
    end
    arr
end