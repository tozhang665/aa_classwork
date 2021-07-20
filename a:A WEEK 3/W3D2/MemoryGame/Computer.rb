class Computer

  def initialize
  end
   
  def make_guess(arr,num)
    if arr.length > 0
      sleep(1)
      return arr[0].sample
    else
      sleep(3)
      random_guess = [rand(0...4), rand(0...4)]
      return random_guess
    end
  end

end
