def all_words_capitalized?(words)
    words.all?{|word| word.capitalize == word}
end

def no_valid_url?(urls)
    urls.none?{|url| endBlock(url)}
end
def endBlock(str)
    suffixes = [".com",".net",".io",".org"]
    suffixes.each{|suffix|
        if str.include?(suffix)
            return true
        end
    }
    return false
end

def any_passing_students?(students)
    average = Proc.new{|arr|
        count = 0.0
        arr.each{|val|
            count+=val
        }
        count / arr.length
    }
    students.each{|student|
        student[:grades] = average.call(student[:grades]) 
    }
    students.any?{|student| p student 
        student[:grades] > 75}

end
