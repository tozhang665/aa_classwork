class PolyTreeNode
  #any amount of children
  #pretty much nodes
  attr_reader :value, :children, :parent

  def initialize(value)
      @value = value
      @parent = nil
      @children = []
  end
  
  def parent=(node)
    if self.parent != nil
      @parent.children.delete(self)
    end

    @parent = node

    if node != nil
      node.children << self if !node.children.include?(self)
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "child_node is not a child" if !child_node.parent
    child_node.parent = nil    
  end


  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
        result = child.dfs(target_value)
        return result if result
    end
    nil
  end

  def bfs(target_value) #Queue
    stack = [self]
    until stack.empty?
      ele = stack.shift
      # return ele.pastPos if ele.value == target
      return ele if ele.value == target_value
      stack += ele.children
    end
    nil
  end 

end




    # def initialize(pos)
    #     # @pos = pos
    #     @root_node = PolyTreeNode.new(pos)
    #     @considered_positions = [pos]
        
    #     # self.build_move_tree
    # end

    # def new_move_positions(pos)
    #   new_positions = Knight.valid_moves(pos).select { |move| !@considered_positions.include?(move) }
    #   @considered_positions += new_positions
    #   new_positions
    # end
    

    # #[[0,0]]  -- > [3,3]
    # #[[1, 2], [2, 1]]
    # #[[]]

    # def build_move_tree(target)
    #   stack = [PolyTreeNode.new(@root_node)]

    #   until stack.empty?
    #     node = stack.shift
    #     return node if node.value == target
    #     positions = self.new_move_positions(ele.value)
    #     positions.each do |pos|
    #       PolyTreeNode.new(pos).parent = ele
    #     end
    #     stack += ele.children
    #   end
    #   nil
    # end

    # def find_path(target)

    # end

