# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'
require 'byebug'
require 'pry'
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
    # byebug
    return find(value, tree_node.left) if value < tree_node.value 
    return find(value, tree_node.right) if value > tree_node.value 

  end

  def delete(value) 
    node = find(value)
    return nil if node.nil? 
    # node.parent.remove_child(value) if node.left.nil? && node.right.nil? #no children
    if node.num_children == 0
      if node == @root #special case b/c no parent 
        @root = nil 
        return nil
      end 
      node.parent.remove_child(value)
      # byebug 
    elsif node.num_children == 1
      child = node.children[0]
      node.parent.replace_child(value, child)
    else 
      # two children
      #get maximum of the left children 
      replacement_node = maximum(node.left)
      # byebug
      replacement_node.parent.replace_child(replacement_node.value, replacement_node.left)
      replacement_node.left = node.left 
      replacement_node.right = node.right
      node.parent.replace_child(value, replacement_node)
    end 
    # byebug
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    node = tree_node 
    #go right as far as possible 
    while node.right 
      node = node.right 
    end 
    node 
  end

  def depth(tree_node = @root)
    node = tree_node 
    max_depth(node) - 1
  end 

  def max_depth(node, counter = 0)
    return counter if node.nil?
    counter += 1
    left_depth = max_depth(node.left, counter)
    right_depth = max_depth(node.right, counter)
    if left_depth > right_depth 
      return left_depth 
    else 
      return right_depth 
    end 
  end 

  def is_balanced?(tree_node = @root)
    #difference in depth between left and right subtrees is at most 1 
    return true if tree_node.nil? || tree_node.num_children == 0
    left_tree_depth = depth(tree_node.left)
    right_tree_depth = depth(tree_node.right)
    left_balanced = is_balanced?(tree_node.left)
    right_balanced = is_balanced?(tree_node.right)
    left_balanced && right_balanced && (left_tree_depth - right_tree_depth).abs <= 1
    # debugger 
  end

  #essentially a depth first search - go to min value then work up
  def in_order_traversal(tree_node = @root, arr = [])
    node = tree_node 

    while node.left 
      node = node.left 
    end 
    arr << node.value
    node = node.parent 
    arr << node.value 
    node = node.right 
    while node.right 
      arr << node.value 
      node = node.right 
    end 

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
bst.insert(6)
bst.insert(5.5)

p bst.is_balanced?
# debugger 
# binding.pry
# p bst.find(7)
