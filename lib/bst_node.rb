class BSTNode
  attr_reader :value
  attr_accessor :left, :right, :parent
  def initialize(value)
    @value = value
  end
  def left=(node)
    node.parent = self
    @left = node
  end 
  def right=(node)
    node.parent = self 
    @right = node
  end 
  def num_children 
    children.length 
  end 
  def children
    [@left, @right]
  end 
  def remove_child(value)
    if value == @left.value 
      @left = nil
    elsif value == @right.value 
      @right = nil  
    else 
      return nil
    end 
  end 
  # def remove_child(value)
  #   if node.left == 
  # end 
end
