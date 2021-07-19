class Bootcamp
    
####################PART 1####################

    def initialize(name,slogan,student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new{|hash,key| hash[key] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(str)
        @teachers << str
    end
    
    def enroll(name)
        if @students.length < @student_capacity
            @students << name
            return true
        else
            return false
        end
    end
    def enrolled?(name)
        @students.include?(name) 
    end
####################PART 2####################
    def student_to_teacher_ratio
        return (students.length) / (teachers.length)
    end

    def add_grade(student,score)
        if @students.include?(student)
            @grades[student] << score
            return true
        else
            return false
        end
    end

    def num_grades(name)
        return @grades[name].length
    end
    
    def average_grade(name)
        if !@grades.include?(name)
            return nil
        end
        @grades[name].sum / @grades[name].length
    end
end
