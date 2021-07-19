def palindrome?(str)
    reversedStr = ""
    str.each_char{|char|
        reversedStr = char + reversedStr
    }
    return reversedStr == str
end
def substrings(str)
    subs = []
    str.each_char.with_index do |char,idx|
        subs << subPartial(str[idx..-1])
    end
    subs.flatten
end

def subPartial(word)
    arr = []
    word.each_char.with_index do |char,idx|
        arr << word[0..idx]
    end
    arr
end

def palindrome_substrings(str)
    arr = substrings(str)
    palin = []
    arr.each do |partial|
        if palindrome?(partial) && partial.length > 1
            palin << partial
        end
    end
    palin
end