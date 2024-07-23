def solution(n, arr)
  depths = [0] * n

  root = split(arr, 0)

  queue = [root]
  until queue.empty?
    node = queue.shift
    index = arr.index(node.value)
    depths[index] = node.depth
    queue.push(node.left) if node.left
    queue.push(node.right) if node.right
  end
  depths.join(' ')
end

def split(arr, depth)
  return nil if arr.empty?

  return Node.new(arr[0], depth) if arr.length == 1

  max_index = arr.each_with_index.max[1]
  node = Node.new(arr[max_index], depth)
  node.left = split(arr[0...max_index], depth + 1)
  node.right = split(arr[max_index + 1..], depth + 1)
  node
end

class Node
  attr_accessor :value, :left, :right, :depth

  def initialize(value, depth)
    @value = value
    @left = nil
    @right = nil
    @depth = depth
  end
end

t = gets.to_i
t.times do
  n = gets.to_i
  arr = gets.split.map(&:to_i)
  puts solution(n, arr)
end
