require "byebug"
def no_dupes?(arr)
    my_arr = []
    arr.each do |ele|
        if arr.count(ele)==1
            my_arr << ele
        end
    end
    p my_arr
end

# no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length-1).each do |idx|
        if arr[idx]==arr[idx+1]
            return false
        end
    end
    return  true
end

# # Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    myHash = Hash.new {|h,k| h[k] = []}
    str.each_char.with_index do |char,idx|
        myHash[char] << idx
    end
    myHash
end

# # Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
    current = ""
    best = ""
    
    (0...str.length).each do |idx|
        if str[idx] == str[idx - 1] || idx ==0
            current +=str[idx]
        else
            current = str[idx]
        end


        if current.length >= best.length
            best = current
        end
    end
    best
end
# 'a a a x y y y y y z z'
#  0 1 2 3 4 5 6 7 8 9 10

    
# # 
# # Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'


def bi_prime?(num)
    n1 = num
    while n1 > 0
        if num % n1 == 0
            n2 = num / n1
            if isprime?(n1)&& isprime?(n2)
                return true
            end
        end

        n1= n1 - 1
    end

    return false
end

def isprime?(num)
    if num <= 2
        return true
    end
    (3...num).each do |val|
        if num % val == 0
             return false
        end
    end
    return true
end

# # Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false


def vigenere_cipher(str,arr)
    alpha = ("a".."z").to_a
    fixed = ""

    str.each_char do |char|
        fixed += alpha[(alpha.index(char) + arr[0])%26]
        arr.rotate!
    end
    fixed
end

# # Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(string)
    str = string[0..-1]
    indexes = []
    str.each_char.with_index do |char,idx|
        if ("aeiou").include?(char)
            indexes<<idx
        end
    end
    rotated = indexes.rotate(-1)
    p indexes
    p rotated
    (0...indexes.length).each do |idx|
        v = string[rotated[idx]]
        str[indexes[idx]] = v
    end
    str
end


# # Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String
    def select(&block)
        block ||= Proc.new{|ch| false}
        myStr = ""
        self.each_char do |char|
            if block.call(char)
                myStr += char
            end
        end
        myStr
    end


    def map!(&block)
        myStr = ""
        self.each_char.with_index do |char,idx|
            self[idx] = block.call(char,idx)
        end
    end

end


# # Examples
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""


# # Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"

# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end

# p word_2        # => "DiJkStRa"



def multiply(num1,num2)
    return num1 if (num2 == 1)
    return -1*num1 if(num2 == -1)

    if num2 > 0
        sum = num1 + multiply(num1,num2-1)
    elsif num2 < 0
        sum = -num1 - (-1*multiply(num1,num2+1))
    end
    sum
end


# num1      num2
# 3           5

# 0 + 5 + 5 + 5 
# 0 + 3 + 3 + 3 + 3 + 3

# 3           -6
# -  -1  -2  -3  -4  -5  -6 
# 0 - 3 - 3 - 3 - 3 - 3 - 3

# 0 - 3 - multipy


# -6          3   

# -6 + -6 + -6

# - 3         - 6  
# 0 - (-3) - (-3) - (-3) - (-3) - (-3) - (-3)

    # elsif num2 < 0
    #     debugger
    #     sum = -num1 - multiply(num1,num2+1)
    # end
    # sum = - (-3) - (multiply(-3,-5))
    # sum = - (-3) - (multiply(-3,-4))
    # sum = - (-3) - (multiply(-3,-3))
    # sum = - (-3) - (multiply(-3,-2))
    # sum = - (-3) - (-1 * -3)
    # sum = - (-3) - (-1 * -3)
    



# # Examples
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18


def lucas_sequence(num)
    return [2,1] if num == 2
    return [2] if num == 1
    return [] if num == 0
    var = lucas_sequence(num-1)
    sum = lucas_sequence(num - 1).push(var[-1] + var[-2])
    sum
end


# Examples
# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

# => [2, 1, 3, 4, 7, 11, 18, 29]

    # [lucas_sequence(7), sum[-1]+sum[-2]]
    # [lucas_sequence(6), sum[-1]+sum[-2]]
    # [lucas_sequence(5), sum[-1]+sum[-2]]
    # [lucas_sequence(4), sum[-1]+sum[-2]]
    # [lucas_sequence(3), sum[-1]+sum[-2]]
    # [2 , 1 , sum[-1]+sum[-2]]



    #note to self cause im going to forgot how i did this. 
    #this is based on the idea that check the last digit in a array is prime.
    #if the last digit is not prime, erase that digit and add in two new
    #digits that are factors with one of them being as small as it can be.
    #the smallest digit should theoretically be prime because on the idea
    #if it were not prime, it would have been able to be divided by a smaller number
    #in the first place.  EXAMPLE:  a factor cant be 6 because 2 would have hit it first
    #

    
def prime_factorization(num)
    if isPrimee?(num)
        return [num]
    end
    factors = [] + smallestFactor(num)

    if isPrimee?(factors[-1])
        return factors
    else
        var = factors[-1]
        arrs = prime_factorization(var)
        factors.pop
        factors += arrs
    end
end

def isPrimee?(num)
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

def smallestFactor(num)
    (2...num).each do |val|
        if num % val == 0
            factor = num / val
            return [val,factor]
        end
    end
    return false
end

# # # Examples
# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]
