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

def optimized_max_windowed_range(array, range)
  
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
    @instack = MyStack.new
    @outstack = MyStack.new
  end

  def empty?
    @instack.empty && @outstack.empty?
  end

  def size
    @instack.size + @outstack.size
  end

  def dequeue
    
  end

  def enqueue(val)
    
  end
end