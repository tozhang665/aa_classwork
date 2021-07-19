class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]


  ##############################PART 1##############################
  def self.random_word
    @random_word = DICTIONARY.sample
    @random_word
  end

  def initialize
    @secret_word = self.class.random_word
    @guess_word = Array.new((@secret_word.length),"_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    attempted_chars.include?(char) ? true : false
  end

  def get_matching_indices(char)
    found = []
    @secret_word.each_char.with_index do |ele,idx|
      if char == ele
        found << idx
      end
    end
    found
  end

  def fill_indices(char,arr)
    arr.each do |idx|
      @guess_word[idx] = char
    end
  end
##############################PART 2##############################

  def try_guess(char)
    if already_attempted?(char)
      puts "char is already attempted"
      return false
    elsif @secret_word.include?(char)
      @attempted_chars << char
      arr = get_matching_indices(char)
      fill_indices(char,arr)
    else
      @attempted_chars << char
      @remaining_incorrect_guesses -= 1
    end
    return true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    ele = gets.chomp
    try_guess(ele)
  end

  def win?
    if @guess_word.join == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end
  
  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      print @secret_word
      return true
    else
      return false
    end
  end

  
end
