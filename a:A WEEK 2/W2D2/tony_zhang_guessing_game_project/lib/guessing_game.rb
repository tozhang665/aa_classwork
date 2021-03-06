class GuessingGame
    def initialize(min,max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end
    
    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        if num > @secret_num
            puts "too big"
            @num_attempts +=1
        elsif num < @secret_num
            puts "too small"
            @num_attempts +=1
        else
            "puts too small"
            puts "you win"
            @game_over = true
        end
    end

    def ask_user
        puts "enter a number"
        userNum = gets.chomp.to_i
        check_num(userNum)
    end
end
