def my_map(arr,&prc)
    blank = []
    arr.each do |val|
        blank << prc.call(val)
    end
    blank
end

def my_select (arr,&prc)
    result = []
    arr.each do |val|
        if prc.call(val)
            result << val
        end
    end
    result
end

def my_count(arr,&prc)
    count = 0
    arr.each{|val|
        if prc.call(val)
            count += 1
        end
    }
    count
end

def my_any?(arr,&prc)
    count = 0
    arr.each do |val|
        if prc.call(val)
            count+=1
        end
    end
    if count == 0
        return false
    end
    return true
end

def my_all?(arr,&prc)
    count = 0
    arr.each do |val|
        if prc.call(val)
            count+=1
        end
    end
    if count != arr.length
        return false
    end
    return true
end

def my_none?(arr,&prc)
    count = 0
    arr.each do |val|
        if prc.call(val)
            count+=1
        end
    end
    if count == 0
        return true
    end
    return false
end