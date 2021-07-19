class Item
        attr_reader :deadline, :done
        attr_accessor :title, :description

    def initialize(title,deadline,desc)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise "invalid date"
        end
        @description = desc
        @done = false
    end

    def self.valid_date?(str)
        sections = str.split("-")
        year = sections[0]
        month = sections[1]
        day = sections[2]
        return false if year.length != 4 || month.to_i > 12 || day.to_i > 31
        return true
    end

    def deadline=(str)
        if Item.valid_date?(str)
            @deadline = str
        else
            raise "invalid date"
        end
    end

    def toggle
        @done = !@done
    end
end