# O(n * n) = O(n^2)
def brute_two_sum?(array, val)
    array.each_with_index do |ele, idx| # n
        (idx+1...array.length).each do |idx2| #(n^2)/2 
            return true if array[idx] + array[idx2] == val
        end
    end
    false
end

#O(n^2)
def sorting_two_sum?(array, val)
    array.sort! # n^2 + n*logn = > n^2
    (0...array.length).each do |i| # O(n)
        grabbed = array.shift # O(1)
        return true if array.bsearch{|value| value == val-grabbed} # O(log n)
        array.push(grabbed)
    end
    return false
end

#hash.set
#hash.get
#[0, 1, 5, 7], 10


#O(n + n) = O(2n) = O(n)
#[0,5,7] 10
#10 - 5 = 5
#REDDDODOOOOOOOOOOOOOOOOOO
# def hash_two_sum?(array, val)
#     hash = Hash.new(0)
#     array.each do |ele| # n
#         hash[ele] = val - ele
#     end
#     hash.each_value do |v| #n
#         return true if hash[v] != 0 && hash[v] != v
#     end
#     false
# end

# O(n)
def hash_two_sum?(array, val)
    seen = Hash.new
    array.each do |e|
        return true if seen.include?(e)
        seen[val-e] = val
    end
    false
end


