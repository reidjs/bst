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
end
