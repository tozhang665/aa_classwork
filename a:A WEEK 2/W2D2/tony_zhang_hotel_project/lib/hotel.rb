require_relative "room"

class Hotel 
    ##############################PART 1##############################
    def initialize(name,hash)
        @name = name
        @rooms = {}


        hash.each do |k,v|
            room = Room.new(v)
            @rooms[k] = room
        end
    end


    def name
        words = @name.split(" ")
        arr = words.map{|ele| ele.capitalize}
        arr.join(" ")
    end
    def rooms
        @rooms
    end
    def room_exists?(str)
        rooms.has_key?(str)
    end
    def check_in(str,room)
        if !room_exists?(room)
            puts "sorry"
        else
            if rooms[room].add_occupant(str)
                puts "successful"
            else
                puts "sorry"
            end
        end
    end
    def has_vacancy?
        @rooms.each do |roomName,room|
            if !room.full?
                return true
            end
        end
        return false
    end

    def list_rooms
        @rooms.each do |roomName,room|
            puts roomName +": " +room.available_space.to_s
        end
    end

end


