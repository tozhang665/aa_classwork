class Flying
    def initialize
        @wow = []
    end

    def meet
        greet
    end

    protected
    def greet
        p "Hello everyone"
    end
end


class Squirrel < Flying
    def hey
        self.greet
    end
end

s = Squirrel.new

s.hey