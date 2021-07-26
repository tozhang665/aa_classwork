require_relative "poly_tree_node.rb"

class Knight
    attr_reader :root_node

    def self.valid_moves(pos)
      considered_positions_temp = []
      x, y = pos
      
    #   [x,y]
    #   @considered_positions << [x+1,y+2] # --> grab all. if either x || y < 0  OOORRRRR x || y > 8  
    #   @considered_positions << [x+1,y-2]
    #   @considered_positions << [x-1,y+2]
    #   @considered_positions << [x-1,y-2]
    #   @considered_positions << [x+2,y+1]
    #   @considered_positions << [x+2,y-1]
    #   @considered_positions << [x-2,y+1]
    #   [x-2,y-1]      


      #x = 5 , y = 3
      (x-2..x+2).each do |row| # 3- 7
        (y-2..y+2).each do |col| # 1 - 5
          if row >= 0 && row <= 7 && col >= 0 && col <= 7
            considered_positions_temp.push([row,col]) if (row - x).abs + (col - y).abs == 3
          end
        end
      end
      return considered_positions_temp
    end


    def initialize(pos)
      @base_pos = pos
      @considered_positions = []
      @root_node = PolyTreeNode.new(pos)
      build_move_tree
    end


    def new_move_positions(pos)
      new_positions = Knight.valid_moves(pos).select {|val| !@considered_positions.include?(val)}
      @considered_positions = @considered_positions + new_positions
      return new_positions
    end
    
    def build_move_tree
      nodes = [self.root_node]
      until nodes.empty?
        currentNode = nodes.shift
        positions = new_move_positions(currentNode.value)
        positions.each do |currentPOS|
          newNode = PolyTreeNode.new(currentPOS)
          currentNode.add_child(newNode)
          nodes << newNode
        end
      end
    end

    # def find_path(end_node)
    #   nodes = []
    #   current_node = end_node
    #   until current_node.nil?
    #     nodes << current_node
    #     current_node = current_node.parent
    #   end
    #   nodes.map{|node| node.value}
    # end


    def find_path(target)
      end_node = self.root_node.bfs(target)
      self.trace_path_back(end_node)
    end

    def trace_path_back(node)
      # end_node = self.root_node.dfs(node)
      # self.find_path(end_node)

      nodes = []
      current_node = node
      until current_node.nil?
        nodes << current_node
        current_node = current_node.parent
      end
      nodes.map{|node| node.value}.reverse
    end

end



# def bfs(target_value) #Queue
#     stack = [self]
#     until stack.empty?
#       ele = stack.shift
#       # return ele.pastPos if ele.value == target
#       return ele if ele.value == target_value
#       stack += ele.children
#     end
#     nil
#   end 