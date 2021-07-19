require "employee"

class Startup
    attr_reader( :name, :funding, :salaries, :employees)


    def initialize(name,num,salaries)
        @name = name
        @funding = num
        @salaries = salaries
        @employees = []
    end


    def valid_title?(str)
        salaries.keys.include?(str)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(name,title)
        if !@salaries.keys.include?(title)
            raise "JOB TITLE DOES NOT EXIST WITHIN SYSTEM"
        else
            @employees << Employee.new(name,title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @funding > @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding = @funding - @salaries[employee.title]
        else
            raise "WE DONT NOT HAVE ENOUGH MONEY TO PAY"
        end
    end

    def payday
        employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        (sum*1.0) / employees.length
    end
    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup2)
        @funding = @funding + startup2.funding
        hash = startup2.salaries
        hash.each{|keys,values| 
            if !@salaries.keys.include?(keys)
                @salaries[keys] = values
            end
        }
        arr = startup2.employees
        arr.each do |ele|
            @employees << ele
        end
        startup2.close
    end
end
