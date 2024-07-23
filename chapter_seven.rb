def dijkstra(graph:, start:)
  costs = graph[start].dup
  parents = {}
  processed = Set.new(start)

  infinity = Float::INFINITY

  graph[start].each_key { |node| parents[node] = start }
  find_lowest_cost_node = lambda do |costs|
    lowest_cost = infinity
    lowest_cost_node = nil
    costs.each do |node, cost|
      if cost < lowest_cost && !processed.include?(node)
        lowest_cost = cost
        lowest_cost_node = node
      end
    end
    lowest_cost_node
  end

  node = find_lowest_cost_node.call(costs)
  until node.nil?
    cost = costs[node]
    neighbors = graph[node]
    if neighbors.nil?
      processed.add(node)
      node = find_lowest_cost_node.call(costs)
      next
    end

    neighbors.each_key do |neighbor|
      new_cost = cost + neighbors[neighbor]
      if (costs[neighbor] || infinity) > new_cost
        costs[neighbor] = new_cost
        parents[neighbor] = node
      end
    end
    processed.add(node)
    node = find_lowest_cost_node.call(costs)
  end

  [costs, parents]
end

graph = {
  Book: { LP: 5, Poster: 0 },
  LP: { Guitar: 15, Drum: 20 },
  Poster: { Guitar: 30, Drum: 35 },
  Guitar: { Piano: 20 },
  Drum: { Piano: 10 }
}

puts dijkstra(graph: graph, start: :Book)
puts

graph = {
  start: { a: 5, b: 2},
  a: { c: 4, d: 2 },
  b: { a: 8, d: 7 },
  c: { d: 6, finish: 3 },
  d: { finish: 1 }
}

puts dijkstra(graph: graph, start: :start)
puts

graph = {
  start: { a: 10 },
  a: { b: 20 },
  b: { c: 1, finish: 30 },
  c: { a: 1 }
}

puts dijkstra(graph: graph, start: :start)
puts

graph = {
  start: { a: 2, b: 2 },
  a: { c: 2, finish: 2 },
  b: { a: 2 },
  c: { b: -1, finish: 2 }
}

puts dijkstra(graph: graph, start: :start)
puts
