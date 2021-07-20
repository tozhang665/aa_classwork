class Player
  def initialize
  end
   
  def make_guess
    puts "User please make an input"
    temp = gets.chomp.split(" ")
    pos = [temp[0].to_i , temp[1].to_i]
    return pos
  end
end
