def naive_max_windowed_range(array, range)
  current_max_range = -Float::INFINITY
  #[1, 0, 2, 5, 4, 8] range = 2
  #(0..6-2).each
  #(0 1 2 3 4)
  (0..array.length-range).each do |idx1|
    #sub = arr[0...2] = arr[0,1]
    #subarr = array[4...6] = array[4 5]
    sub_arr = array[idx1...idx1+range]
    current_max_range = [current_max_range, sub_arr.max - sub_arr.min].max
  end
  current_max_range
end


# <<<<<<<
# [1,2,3]
class MyQueue
  def initialize
    @store = []
  end

  def empty?
    @store.empty?
  end

  def size
    @store.length
  end
  
  def peek
    @store[0]
  end

  def dequeue
    @store.shift
  end

  def enqueue(val)
    @store.push(val)
  end
end
#in <<<<<<<<<
    #[1,2,3,4]
#out >>>>>>>>>
class MyStack
  def initialize
    @store = []
  end

  def empty?
    @store.empty?
  end

  def size
    @store.length
  end
  
  def peek
    @store[-1]
  end

  def pop
    @store.pop
  end

  def push(val)
    @store.push(val)
  end
end

class StackQueue
  def initialize
    @stack = MyStack.new
  end

  def empty?
    @stack.empty?
  end

  def size
    @stack.size
  end

  def dequeue
    @stack.pop
  end

  def peek
    val = @stack.pop
    @stack.push(val)
    val
  end

  def enqueue(val)
    temp = MyStack.new
    until @stack.empty?
      temp.push(@stack.pop)
    end
    temp.push(val)
    until temp.empty?
      @stack.push(temp.pop)
    end
  end
end


class MinMaxStack
  def initialize
    @store = []
    @max = [-Float::INFINITY]
    @min = [Float::INFINITY]
  end

  def empty?
    @store.empty?
  end

  def size
    @store.length
  end
  
  def peek
    @store[-1]
  end

  def pop
    val = @store.pop
    if @max[-1] == val
      @max.pop
    elsif @min[-1] == val
      @min.pop
    end
    return val
  end

  def push(val)
    @store.push(val)
    if val > @max[-1]
      @max << val
    elsif val < @min[-1]
      @min << val
    end
  end
  
  def max
    @max[-1]
  end

  def min 
    @min[-1]
  end
end

b = MinMaxStack.new

b.push(1)
b.push(2)
b.push(3)
b.push(181)
b.push(-123)
b.push(50)

p b.max
p b.min

class MinMaxStackQueue
  def initialize
    @stack = MyStack.new
    @max = [-Float::INFINITY]
    @min = [Float::INFINITY]
  end

  def empty?
    @stack.empty?
  end

  def size
    @stack.size
  end
  
  def peek
    val = @stack.pop
    @stack.push(val)
    val
  end


  def enqueue(val)
    temp = MyStack.new
    until @stack.empty?
      temp.push(@stack.pop)
    end
    temp.push(val)
    until temp.empty?
      val = temp.pop
      if val > @max[-1]
        @max << val
      elsif val < @min[-1]
        @min << val
      end
      @stack.push(val)
    end

  end

  def dequeue
    val = @stack.pop
    if @max[-1] == val
      @max.pop
    elsif @min[-1] == val
      @min.pop
    end
    return val
  end
  
  def max
    @max[-1]
  end

  def min 
    @min[-1]
  end
end

# b = MinMaxStackQueue.new

# b.enqueue(1)
# b.enqueue(2)
# b.enqueue(3)
# b.enqueue(181)
# b.enqueue(-123)
# b.enqueue(50)

# p b.max
# p b.min




def optimized_max_windowed_range(array, range)
  current_max_range = -Float::INFINITY
  queue = MinMaxStackQueue.new
  array.each do |val|
    queue.enqueue(val)
    if queue.size == range
      current_max_range = [current_max_range, queue.max - queue.min].max
      queue.dequeue
    end
  end
  current_max_range
end








# def naive_max_windowed_range(array, range)
#   current_max_range = -Float::INFINITY
#   #[1, 0, 2, 5, 4, 8] range = 2
#   #(0..6-2).each
#   #(0 1 2 3 4)
#   (0..array.length-range).each do |idx1|
#     #sub = arr[0...2] = arr[0,1]
#     #subarr = array[4...6] = array[4 5]
#     sub_arr = array[idx1...idx1+range]
#     current_max_range = [current_max_range, sub_arr.max - sub_arr.min].max
#   end
#   current_max_range
# end

#for sure way for permutations but O(n) = n!

#n^3
def four_sum?(array, val)
  perms = array.permutation(4) # O(n!)
  sums = perms.map{|perm| perm.inject(:+)} # O(4n!)
  sums.include?(val)
end


# O(n)
def two_sum?(array, val)
  seen = Hash.new
  array.each do |e|
      return true if seen.include?(e)
      seen[val-e] = val
  end
  false
end

#n^7
#where everyone go?
def four_sum?(array, val)
  return false if array.length < 4
  array.each_with_index do |ele,idx1|
    return false if idx1+5 > array.length
    (idx1+1..-3).each do |idx2|
      (idx2+1..-2).each do |idx3|
        (idx3+1..-1).each do |idx4|
          return true if (array[idx1]+array[idx2]+array[idx3]+array[idx4]) == val
        end
      end
    end
  end
  return false
end