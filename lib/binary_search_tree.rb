# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'
require 'byebug'
class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value) 
    else 
      position_found = false 
      node = @root
      until node.nil?
        current_position = nil 
        if value <= node.value 
          node.left.nil? ? node.left = BSTNode.new(value) : current_position = node.left
        else 
          node.right.nil? ? node.right = BSTNode.new(value) : current_position = node.right  
        end 
        node = current_position
      end 
    end 
  end


  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if value == tree_node.value 
    byebug
    return find(value, tree_node.left) if value < tree_node.value 
    return find(value, tree_node.right) if value > tree_node.value 

  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end 

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

end

bst = BinarySearchTree.new
bst.insert(5)
bst.insert(3)
bst.insert(1)
bst.insert(8)
bst.insert(7)

# p bst.find(7)
