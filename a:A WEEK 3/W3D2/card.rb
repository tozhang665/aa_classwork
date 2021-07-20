class Card

  attr_reader :show

  #creates card with @token and @show default false/face down
  def initialize(token)
    @token = token
    @revealed = false
    @show = false
  end

  #toggle @show
  def hide
    @show = false
  end

  def show
    @show
  end
  
  def reveal
    @revealed = true
    @show = true
  end

  #returns a string depending on @show
  def to_s
    if @show
      return @token
    else
      return " "
    end
  end

  #token -- needs work
  def token
    @token
  end

  def ==(letter)
    @token == letter
  end

end