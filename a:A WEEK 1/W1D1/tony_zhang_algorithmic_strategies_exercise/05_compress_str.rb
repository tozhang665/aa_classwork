# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(word)
    compressed = ""
    i = 0
    while i < word.length
        char = word[i]
        
        num = 0
        while char == word[i]
            num +=1
            i+=1
        end
        if num > 1
            compressed += num.to_s + char
        else
            compressed += char
        end
    end
    compressed
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
