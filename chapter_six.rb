require_relative 'chapter_two'

class Queue
  def initialize(value)
    @queue = LinkedList.new(Node.new(value))
  end

  def enqueue(value)
    @queue.append(value)
  end

  def dequeue
    @queue.pop_first
  end

  def empty?
    @queue.empty?
  end
end

def breadth_first_search(graph, start)
  queue = Queue.new(start)
  searched = {}

  until queue.empty?
    current = queue.dequeue
    return true if is_target?(current)

    next if searched[current]

    graph[current].each { |neighbor| queue.enqueue(neighbor) }
    searched[current] = true
  end

  false
end

def is_target?(name)
  name == 'mango'
end

# graph = {
#   'you' => %w[alice bob claire],
#   'bob' => %w[anuj peggy],
#   'alice' => %w[peggy],
#   'claire' => %w[johnny thom],
#   'anuj' => [],
#   'peggy' => [],
#   'johnny' => [],
#   'thom' => []
# }
