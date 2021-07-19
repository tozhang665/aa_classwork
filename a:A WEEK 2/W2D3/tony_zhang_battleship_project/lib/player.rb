class Player
    def get_move
        print "enter a position with coordinates seperated with a space like `4 7` "
        input = gets.chomp.split(" ")
        pos = [input[0].to_i,input[1].to_i]
        p "HEHHHHHHHEEEEEEEEELLLLLLOOOOOOOOOO"
        p pos
        p "OOOOOOVVVVVEEEEEERRRRRRRRRR"
        return pos
    end
end
