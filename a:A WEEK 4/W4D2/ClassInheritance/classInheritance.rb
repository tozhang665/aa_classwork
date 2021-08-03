#test
class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name,title,salary,boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        (@salary) * multiplier
    end
end

class Manager < Employee

    attr_reader :employed
    def initialize(name,title,salary,boss)
        super(name,title,salary,boss)
        @employed = [] # array of employees
    end

    def bonus(multiplier)
        total_salary = 0
        @employed.each do |employee|
            if employee.is_a?(Manager)
                employee.employed.each do |employee2|
                    total_salary += employee2.salary
                end
                total_salary += employee.salary
            else
                total_salary += employee.salary
            end
        end
        total_salary * multiplier
    end

    def hire(person)
        @employed << person
    end

end

David = Employee.new("David","TA",10000,"Darren")
Shawna = Employee.new("Shawna","TA",12000,"Darren")
Darren = Manager.new("Darren","TA Manager",78000,"Ned")
Ned = Manager.new("Ned","Founder",1000000,"nil")

Ned.hire(Darren)
Darren.hire(Shawna)
Darren.hire(David)

p Ned.bonus(5) # => 500_000
p Darren.bonus(4) # => 88_000
p David.bonus(3) # => 30_000


