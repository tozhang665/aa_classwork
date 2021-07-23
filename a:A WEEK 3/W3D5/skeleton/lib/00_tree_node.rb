class PolyTreeNode
  #any amount of children
  #pretty much nodes
  attr_reader :value

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
      return ele if ele.value == target_value
      stack += ele.children
    end
    nil
  end

  private

  attr_reader :children, :parent

end
