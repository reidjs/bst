require_relative 'binary_search_tree'
require 'byebug'
def kth_largest(tree_node, k)
  #traverse the bst in order and take array[-k]
  # byebug
  arr = BinarySearchTree.in_order_traversal2(tree_node)
  arr[-k]
end

def traverse

end 
