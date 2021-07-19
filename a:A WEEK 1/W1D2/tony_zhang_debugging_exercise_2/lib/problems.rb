# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
def largest_prime_factor(num)
    primes = []
    (2..num).each do |val|
        if (num % val == 0 && primeCheck(val))
            primes << val
        end
    end
    p
    primes[-1]
end

def primeCheck(num)
  if num < 2
    return false
  end
    (2...num).each do |val|
        if num % val == 0
            return false
        end
    end
    return true
end

def unique_chars?(str)
    charHash = Hash.new(0)
    str.each_char do |char|
        charHash[char] += 1
    end
    count = charHash.values
    count.each do |val|
        if val > 1
            return false
        end
    end
    return true
end

def dupe_indices(arr)
    countHash = Hash.new(0)
    alphaHash = Hash.new([])
    arr.each{|val| countHash[val] += 1}
    countHash.each do |key,value|
        if value > 1
            alphaHash[key] = indicReturn(arr,key)
        end
    end
    alphaHash
end

def indicReturn(arr,char)
    indexes = []
    arr.each_with_index do |alpha,idx|
        if alpha == char
            indexes << idx
        end
    end
    indexes
end

def ana_array(arr1, arr2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    arr1.each{|val| hash1[val] += 1}
    arr2.each{|val| hash2[val] += 1}
    return hash1 == hash2
end