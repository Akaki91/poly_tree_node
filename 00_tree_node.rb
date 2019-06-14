require "byebug"

class PolyTreeNode
  
  attr_accessor :parent, :children

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent
    @parent
  end


  def children
    @children
  end

  def value 
    @value
  end

  def parent=(parent)
    if @parent != nil 
      @parent.children.delete(self)
      @parent = parent 
      if parent != nil 
        @parent.children << self 
      end
    else 
      @parent = parent
      @parent.children << self
    end
  end


  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      node = child.dfs(target_value)
      return node if node != nil
    end
    return nil
  end

  def bfs(target_value)
    queue = []
    queue << self
    until queue.empty?
      node = queue[0]
      if node.value == target_value 
        return node
      else 
        queue.shift
        node.children.each do |child|
          queue << child 
        end
      end
    end
    return nil
  end

end

