require 'minitest/autorun'
require_relative 'chapter_one'
require_relative 'chapter_two'
require_relative 'chapter_three'

class AlgorithmsTest < Minitest::Test
  def test_binary_search
    my_list = [1, 3, 5, 7, 9, 11, 13, 15]
    assert_equal(0, binary_search(my_list, 1))
    assert_equal(1, binary_search(my_list, 3))
    assert_equal(2, binary_search(my_list, 5))
    assert_equal(3, binary_search(my_list, 7))
    assert_equal(4, binary_search(my_list, 9))
    assert_equal(5, binary_search(my_list, 11))
    assert_equal(6, binary_search(my_list, 13))
    assert_equal(7, binary_search(my_list, 15))
    assert_nil(binary_search(my_list, 8))
  end

  def test_selection_sort
    assert_equal([2, 3, 5, 6, 10], selection_sort([5, 3, 6, 2, 10]))
  end

  def test_linked_list_append
    node = Node.new(1)
    linked_list = LinkedList.new(node)
    linked_list.append(2)
    linked_list.append(3)
    assert_equal(3, linked_list.length)
    assert_equal(3, linked_list.last.value)
    assert_equal(1, linked_list.head.value)
  end

  def test_linked_list_prepend
    node = Node.new(1)
    linked_list = LinkedList.new(node)
    linked_list.prepend(2)
    linked_list.prepend(3)
    assert_equal(3, linked_list.length)
    assert_equal(1, linked_list.last.value)
    assert_equal(3, linked_list.head.value)
  end

  def test_linked_list_insert
    node = Node.new(1)
    linked_list = LinkedList.new(node) # [1]
    linked_list.insert(2, 1) # [1, 2]
    linked_list.insert(3, 2) # [1, 2, 3]
    linked_list.insert(4, 0) # [4, 1, 2, 3]
    assert_equal(4, linked_list.length)
    assert_equal(3, linked_list.last.value)
    assert_equal(4, linked_list.head.value)
    assert_raises(ArgumentError) { linked_list.insert(5, 5) }
  end

  def test_linked_list_delete
    node = Node.new(1)
    linked_list = LinkedList.new(node) # [1]
    linked_list.append(2) # [1, 2]
    linked_list.append(3) # [1, 2, 3]
    linked_list.delete(1) # [1, 3]
    assert_equal(2, linked_list.length)
  end

  def test_linked_list_each
    node = Node.new(1)
    linked_list = LinkedList.new(node) # [1]
    linked_list.append(2) # [1, 2]
    linked_list.append(3) # [1, 2, 3]
    arr = []
    linked_list.each { |value| arr << value }
    assert_equal([1, 2, 3], arr)
  end

  def test_linked_list_enumerable
    node = Node.new(1)
    linked_list = LinkedList.new(node) # [1]
    linked_list.append(2) # [1, 2]
    linked_list.append(3) # [1, 2, 3]
    arr = linked_list.map { |value| value * 2 }
    assert_equal([2, 4, 6], arr)
    assert_equal(true, linked_list.include?(2))
  end

  def test_linked_list_access
    node = Node.new(1)
    linked_list = LinkedList.new(node) # [1]
    linked_list.append(2) # [1, 2]
    linked_list.append(3) # [1, 2, 3]
    assert_equal(1, linked_list[0])
    assert_equal(2, linked_list[1])
    assert_equal(3, linked_list[2])
  end

  def test_stack
    stack = Stack.new(1)
    stack.push(2)
    stack.push(3)
    assert_equal(1, stack.peek)
    assert_equal(3, stack.pop)
    assert_equal(2, stack.pop)
    assert_equal(1, stack.pop)
    assert_equal(true, stack.empty?)
    assert_nil(stack.pop)
  end
end
