# Be able to determine the time and space complexity of a method
# Be able to compare the time complexity of one method to another
# Be able to recognize when time or space complexity can be improved

#phase 1
#O(n * n) = n^2 => O(n^2)

def my_min1(list)
    return [] if list.empty?
    minimums = []
    list.each do |ele1|
        list.each do |ele2|
            if ele1 >= ele2
                minimums << ele2
            end
        end
    end
    minimums.min
end

#O(n) = n^2 => O(n^2)
# def my_min3(list)
#     minimum = list[0]
#     list.each_with_index do |ele,idx|
#         list.each_with_index do |ele2,idx2|
#             if idx != idx2
#                 if ele < ele2

#                 end
#             end
#         end
#     end
# end

#phase 2
#O(n) = 2n => O(n)

def my_min2(list)
    return [] if list.empty?
    minimum = list[0]
    list[1..-1].each do |element|
        if element < minimum
            minimum = element
        end
    end
    return minimum
end



# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min1(list)  # =>  -5




# n^2


# def largest_contiguous_subsum(list)

#     subset = []
#     list.each.with_index do |ele, idx|
#         (idx + 1...list.length-1).each do |idx2|
#             subset << list[idx..idx2]
#         end
#     end
#     sums = []
#     subset.each do |arr|
#         sums << arr.sum
#     end
#     sums.max
# end

#O(n^3)
def largest_contiguous_subsum_1(list)
  maximum = -Float::INFINITY
  (list.length-1).downto(0).each do |last_i|
    (0..last_i).each do |first_i|
      sub = list[first_i..last_i].inject(:+)
      maximum = [maximum, sub].max
    end
  end
  maximum
end

#O(n)
def largest_contiguous_subsum_2(list)
  memo = Array.new(list.length){ -Float::INFINITY }
  memo[0] = list[0]
  (1...list.length).each do |i|
    memo[i] = [memo[i-1] + list[i], list[i]].max
  end
  memo.max
end

# # [2, 3, -6, 7, -6, 7]
# def largest_contiguous_subsum(list)
#     maximum = -Float::INFINITY # 5
#     past_max = list[0] # 5
#     past = list[0] # -6
#     list[1..-1].each.with_index do |val, i| # -6
#         maximum = val if val > maximum # 3
#         if past < past + val 
#             past = past + val
#             past_max = [past_max, past].max
#         else
#             past_max = [past_max, past].max
#             past = val
#         end
#         maximum = [maximum, past_max].max
#     end
#     maximum
# end


# def tester(list)
#     largestSum = list.shift
#     currentSum = largestSum
#     list.each_with_index do |ele,idx|
#         currentSum += ele
#         if currentSum >= largestSum
#             largestSum = currentSum
#         end
#     end
#     largestSum
# end

list = [5, 3, -7]
p largest_contiguous_subsum_2(list) # => 8
# p tester(list)
#larges =  2  5   5   7  7  8 
#cursum =  0  2  5  -1  6  0   7
list    = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_2(list) # => 8 (from [7, -6, 7])
# p tester(list)

list = [-5, -1, -3]
p largest_contiguous_subsum_2(list) # => -1 (from [-1])

# p tester(list)

