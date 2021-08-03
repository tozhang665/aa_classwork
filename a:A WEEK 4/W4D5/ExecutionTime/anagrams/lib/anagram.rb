#O(n!)
def first_anagram?(string1,string2)
    arr = []
    string1.split(//).permutation.each do |permute|
        arr << permute.join("") 
    end
    arr.include?(string2)
end

def second_anagram?(string1,string2)
    return false if string1.length != string2.length
    char2 = string2.split("")
    string1.each_char do |char|
        index = char2.index(char)
        return false if index == nil
        char2.delete_at(index)
    end
    char2.length == 0 ? (return true) : (return false)
end

#O(n^2)
def third_anagram?(string1,string2)
    return false if string1.length != string2.length
    string1.split("").sort == string2.split("").sort
end
#O(n)
def fourth_anagram?(string1,string2)
    return false if string1.length != string2.length
    hash1 = Hash.new{|h,k| h[k] = 0} # == Hash.new(0)
    hash2 = Hash.new{|h,k| h[k] = 0}
    string1.each_char do |ele|
        hash1[ele] += 1
    end

        
    string2.each_char do |ele|
        hash2[ele] += 1
    end
    
    # string1.each do |char|
    #     return false unless hash2.include?(char)
    #     return false if hash2[char] == hash1[char]
    # end
    # true
    hash1 == hash2
end



