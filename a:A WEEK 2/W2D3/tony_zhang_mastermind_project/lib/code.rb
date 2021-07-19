class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(arr)
    # arr.each do |ele|
    #   if !POSSIBLE_PEGS.include?(ele.upcase)
    #     return false
    #   end
    # end
    arr.each {|ele| return false if !POSSIBLE_PEGS.include?(ele.upcase)}
    true
  end

  def initialize(arr)
    # if self.class.valid_pegs?(arr)
    #   @pegs = arr.map{|ele| ele.upcase}
    # else
    #   raise "ERROR"
    # end
    self.class.valid_pegs?(arr) ? (@pegs = arr.map{|ele| ele.upcase}) : (raise "ERROR")
  end

  def pegs
    @pegs
  end

  def self.random(num)
    possible = POSSIBLE_PEGS.keys
    arr = []
    (0...num).each{|val| arr << possible[rand(0...4)]}
    Code.new(arr)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end
  
  def [](num)
    @pegs[num]
  end

  def length
    @pegs.length
  end


  def num_exact_matches(codeVar)
    count = 0
    inComing = codeVar.pegs
    current = @pegs
    # inComing.each_with_index do |ele,idx|
    #   # if inComing[idx] == current[idx]
    #   #   count+=1
    #   # end
    #   count+=1 if inComing[idx] == current[idx]
    # end

    inComing.each_with_index {|ele,idx| count+=1 if inComing[idx] == current[idx]}
    count
  end


  def num_near_matches(codeVar)
    count = 0
    inComing = codeVar.pegs
    current = @pegs
    tester1 = []
    tester2 = []

    inComing.each_with_index do |ele,idx|
      if inComing[idx] != current[idx]
        tester1 << inComing[idx]
        tester2 << current[idx]
      end
    end

    tester1.each do |ele|
      if tester2.include?(ele)
        tester2.delete_at(tester2.index(ele))
        count +=1
      end
    end
    count
  end


  

  def ==(codeVar)# [obj1] = [obj2]
    codeVar.pegs == @pegs
  end


end
