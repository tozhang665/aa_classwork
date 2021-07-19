require "./item.rb"

class List
    
    attr_reader :label ,:items

    def initialize(label)
        @label = label
        @items = []
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title,deadline,description="")
        if Item.valid_date?(deadline)
            @items << Item.new(title,deadline,description)
        else
            raise "deadline does not have a proper date"
        end
    end

    def size
        @items.length
    end


    def valid_index?(index)
        return false if index < 0
        return @items[index] != nil
    end


    def swap(index_1,index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        else
            return false
        end
    end

    def [](idx)
        @items[idx]
    end

    def priority
        @items[0]
    end

    def print
        puts "-------------------------------------------------------"
        puts "                      #{@label}                  "
        puts "-------------------------------------------------------"
        puts "Index | Item                         | Deadline  | Done"
        puts "-------------------------------------------------------"
        @items.each_with_index do |item,idx|
            if item.done
                mark = "[X]"
            else
                mark = "[ ]"
            end
            puts "#{idx.to_s.ljust(6)}| #{item.title.ljust(29)}| #{item.deadline}| #{mark}"
        end
        puts "-------------------------------------------------------"
    end


    def print_full_item(index)
        if valid_index?(index)
            item = @items[index]
            if item.done
                mark = "[X]"
            else
                mark = "[ ]"
            end
            puts "-----------------------------------------------------"
            puts "#{item.title.ljust(37)}| #{item.deadline} | #{mark}"
            puts "#{item.description}"
            puts "-----------------------------------------------------"
        end
    end

    def print_priority
        print_full_item(@items[0])
    end

    def up(idx,amt=1)
        if @items[idx] == nil
            return false
        end
        grabbed = @items[idx]
        while amt > 0 
            if @items.index(grabbed) == 0
                return true
            end
            idx = @items.index(grabbed)
            @items[idx],@items[idx-1] = @items[idx-1],@items[idx]
            amt -=1
        end
        return true
    end

    def down(idx,amt=1)
        if @items[idx] == nil
            return false
        end
        grabbed = @items[idx]
        while amt > 0 
            if @items.index(grabbed) == self.size-1
                return true
            end
            idx = @items.index(grabbed)
            @items[idx],@items[idx+1] = @items[idx+1],@items[idx]
            amt -=1
        end
        return true
    end

    def sort_by_date!
        @items.sort_by!{|item| item.deadline}
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def purge
        @items = @items.select{|item| !item.done}
    end

    def remove_item(index)
        if index >= @items.length
            return false
        else
            @items.delete_at(index)
            return true
        end
    end
end