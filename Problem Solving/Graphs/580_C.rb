n, m = gets.split.map(&:to_i)
cats = gets.split.map(&:to_i)

tree = {}
(n - 1).times do
  a, b = gets.split.map(&:to_i)
  tree[a] ||= []
  tree[a] << b
end

# n = 7
# m = 1
# cats = [1, 0, 1, 1, 0, 0, 0]
# tree = { 1 => [2, 3], 2 => [4, 5], 3 => [6, 7] }

root = 1
queue = [[root, cats[root - 1], 0]]
count = 0
until queue.empty?
  node, cat, cats_count = queue.shift
  cats_count += 1 if cats[node - 1] == 1
  cats_count = 0 if (cats[node - 1]).zero?

  if tree[node]
    tree[node].each do |child|
      queue << [child, cats[child - 1], cats_count] if cats_count <= m
    end
  elsif cats_count <= m
    count += 1
  end
end

puts count
