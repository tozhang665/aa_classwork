def is_prime?(num)
    return false if num < 2
    (2...num).each do |val|
        return false if num % val == 0
    end
    true
end

def nth_prime(num)
    count = 0
    prime = 0
    while count < num
        prime +=1
        if is_prime?(prime)
            count += 1
        end
    end
    prime
end

def prime_range(num1,num2)
    array = []
    (num1..num2).each do |val|
        if is_prime?(val)
            array << val
        end
    end
    array
end