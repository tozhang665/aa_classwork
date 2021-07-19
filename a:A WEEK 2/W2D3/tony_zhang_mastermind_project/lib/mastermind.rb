require_relative "code"

class Mastermind

    def initialize(num)
        @secret_code = Code.random(num)
    end

    def print_matches(codeVar)
        print "Exact matches are: "
        puts @secret_code.num_exact_matches(codeVar)
        print "Near matches are: "
        puts @secret_code.num_near_matches(codeVar)
    end

    def ask_user_for_guess
        print "Enter a code: "
        input = gets.chomp
        print_matches(Code.from_string(input))
        # if @secret_code == Code.from_string(input)
        #     return true
        # else
        #     return false
        # end
        @secret_code == Code.from_string(input) ? (return true) : (return false)
    end
    
end
