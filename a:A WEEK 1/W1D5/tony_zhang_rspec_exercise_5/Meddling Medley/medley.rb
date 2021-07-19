##########################     PHASE 1    ###################################

def duos(str)
    count = 0
    str.each_char.with_index do |char,idx|
        if idx == (str.length - 1)
            break
        end
        if str[idx] == str[idx+1]
            count +=1
        end
    end
    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(str,hash)
    words = str.split(" ")
    words.each_with_index do |word,idx|
        if hash.has_key?(word)
            words[idx] = hash[word]
        end
    end
    words.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash,proc,&block)
    hash2 = Hash.new(0)
    hash.each do |k,v|
        hash2[block.call(k)] = proc.call(v)
    end
    hash2
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(str)
    hash = Hash.new(0)
    str.each_char do |char|
        hash[char] += 1 
    end
    arr = []
    hash.each do |k,v|
        if v > 2
            arr << k
        end
    end
    arr
end


# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(str)
    (2...str.length).each do |idx|
        if (str[idx] == str[idx-1]) && (str[idx]== str[idx - 2])
            return true
        end
    end
    false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(str,hash)
    words = str.split(" ")
    words.each_with_index do |word,idx|
        replace = ""
        word.each_char.with_index do |char,idx2|
            if hash.has_key?(char)
                replace +=hash[char]
            else
                replace += "?"
            end
        end
        words[idx] = replace
    end
    words.join(" ")

end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
    idx = 0
    retStr = ""
    while idx < str.length
        str[idx+1].to_i.times do 
            retStr +=str[idx]
        end
        idx +=2
    end
    retStr
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

##########################     PHASE 2    ###################################

def conjunct_select(arr,*procs)
   procs.each{|proc| arr = arr.select{|val|proc.call(val)}}
   arr
end


# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]


def convert_pig_latin(str)
    words = str.split(" ")
    words.each_with_index do |word,idx|
        if word.length >= 3
            ("aeiou").include?(word[0].downcase) ? words[idx] = word + "yay" : words[idx] = word[1..-1] + word[0] + "ay"
        end
    end
    words.join(" ")
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"


def reverberate(str)
    words = str.split(" ")
    words.each_with_index do |word,idx|
        if word.length >=3
            if ("aeiou").include?(word[-1])
                words[idx] = word*2
            else
                vowelsIdx = []
                word.each_char.with_index do |char,idx2|
                    if ("aeiou").include?(char)
                        vowelsIdx << idx2
                    end
                end
                words[idx] = word + word[vowelsIdx[-1]..-1]
            end
        end
    end
    words.join(" ")
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"


def disjunct_select(arr,*procs)
    my_arr = []
    arr.each do |ele|
        procs.each do |proc|
            if proc.call(ele)
            my_arr << ele
            end
        end
    end
    my_arr.uniq
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(str)
    words = str.split(" ")
    switch = 0
    words.each_with_index do |word,idx|
        if switch == 0
            words[idx] = remove_vowel(word)
            switch = 1
        else
            words[idx] = remove_vowel(word.reverse).reverse
            switch = 0
        end
    end
    words.join(" ")
end

def remove_vowel(word)
    word.each_char.with_index do |char,idx|
        if ("aeiouAEIOU").include?(char)
            return word[0...idx] + word[idx+1 .. -1]
        end
    end
end


# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"


def silly_talk(str)
    words = str.split(" ")
    words.each_with_index do |word,idx|
        if ("aeiou").include?(word[-1])
            words[idx] = word + word[-1]
        else
            chars = word.split("")
            base = ""
            chars.each do |char|
                if ("aeiou").include?(char)
                    base += (char + "b" + char)
                else
                    base += char
                end
            end
            words[idx] = base
        end
    end
    words.join(" ")
end


# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"


def compress(str)
    base = ""
    count = 1
    str.each_char.with_index do |char,idx|
        if str[idx] == str[idx+1]
            count+=1
        else
            if count == 1
                base = base + char
            else
                base = base + char + count.to_s
            end
            count = 1
        end
    end
    base
end

# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"