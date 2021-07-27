#test
class Employee
    def initialize(name)
        @name = name
    end

    def scream
        p "AAAAAARRRGGGHHHHH GET ME OUT OF HEERREEEE"
    end
end

class Manager < Employee
    def initialize(name)
        super
    end
    def scream
        p "AAHHHHHHH"
    end
end

class Ceo < Employee
    def relax
        p "i just get paid"
    end
end