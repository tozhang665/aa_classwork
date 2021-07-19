def hipsterfy(word)
    vowels = "aeiou"
    vowelCount = 0
    word.each_char do |char|
        if vowels.include?(char)
            vowelCount+=1
        end
    end
    if vowelCount <= 1
      return word
    end
    reversedWordArray = word.reverse().split("")
    reversedWordArray.each_with_index do |char,idx|
        if vowels.include?(char)
            reversedWordArray[idx] = ""
            return reversedWordArray.reverse().join("")
        end
    end
end

def vowel_counts(str)
    vowels = "aeiou"
    vowelHash = Hash.new(0)
    str.downcase.each_char do |char|
        if vowels.include?(char)
            vowelHash[char] +=1
        end
    end
    return vowelHash
end

def caesar_cipher(word,count)
    result = ""
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    word.each_char do |char|
        if alphabet.include?(char)
            result += alphabet[((alphabet.index(char) + count )% 26)]    
        else
            result += char
        end
    end
    result
end
