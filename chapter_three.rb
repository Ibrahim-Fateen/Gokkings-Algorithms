# Recursion and Stacks

require_relative 'chapter_two'

def factorial(num)
  return 1 if num == 1

  num * factorial(num - 1)
end

class Stack
  # No attribute getters or setters
  # to avoid direct access to the LinkedList.
  # Instead, the Stack class provides methods
  # for pushing, popping, peeking, and checking
  # if the stack is empty.

  def initialize(value)
    @stack = LinkedList.new(Node.new(value))
  end

  def push(value)
    @stack.prepend(value)
  end

  def pop
    @stack.pop_first
  end

  def peek
    @stack.last.value
  end

  def empty?
    @stack.empty?
  end
end
