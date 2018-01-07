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
  #returns 
  def children
    result = []
    result << @left unless @left.nil?
    result << @right unless @right.nil?
    result 
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
  def replace_child(child_value, node)
    if child_value == @left.value 
      @left = node 
    elsif child_value == @right.value 
      @right = node 
    else 
      throw "Cannot replace because this child doesnt exist"
    end 
  end 
  # def remove_child(value)
  #   if node.left == 
  # end 
end
