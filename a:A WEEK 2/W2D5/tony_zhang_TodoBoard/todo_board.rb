require "./list.rb"

class ToDoBoard
    def initialize()
        @list = {}
    end

    def get_command
        print "Enter a command please: "
        cmd , *args = gets.chomp.split(" ")
        case cmd
        when 'mklist'
            @list[args[0]] = List.new(args[0])

        when 'ls'
            @list.each do |k,v|
                puts v.label
            end
        when 'showall'
            @list.each do |k,v|
                v.print
            end
        when 'mktodo'
            @list[args[0]].add_item(args[1],args[2],args[3])
        when "up"
            if args.length == 3
                @list[args[0]].up(args[1].to_i,args[2].to_i)
            else
                @list[args[0]].up(args[1].to_i)
            end
        when "down"
            if args.length == 3
                @list[args[0]].down(args[1].to_i,args[2].to_i)
            else
                @list[args[0]].down(args[1].to_i)
            end
        when "swap"
            @list[args[0]].swap(args[1].to_i,args[2].to_i)
        when "sort"
            @list[args[0]].sort_by_date!
        when "priority"
            @list[args[0]].print_priority
        when "print"        
            if args.length == 2
                @list[args[0]].print_full_item(args[1].to_i)
            else
                @list[args[0]].print
            end
        when 'toggle'
            @list[args[0]].toggle_item(args[1].to_i)
        when 'purge'
            @list[args[0]].purge
        when 'rm'
            @list[args[0]].remove_item(args[1].to_i)
        when 'quit'
            return false
        else
            print "sorry that command is not recognized \n"
        end
        return true
    end

    def run
        bool = true
        while bool
            bool = get_command
        end
    end
end