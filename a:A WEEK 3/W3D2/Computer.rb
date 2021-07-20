class Computer

  def initialize
  end
   
  def make_guess
    sleep(2)
    random_guess = [rand(0...4), rand(0...4)]
    return random_guess
  end
end
