class LinkedList
  include Enumerable

  attr_reader :head, :last, :length

  def initialize(node)
    @head = node
    @last = node
    @length = 1
  end

  def append(value)
    node = Node.new(value)
    @last.next = node if @last
    @last = node
    @head = node if @length.zero?
    @length += 1
  end

  def prepend(value)
    node = Node.new(value)
    node.next = @head
    @head = node
    @last = node if @length.zero?
    @length += 1
  end

  def pop_last
    to_return = @last
    current = @head
    (length - 2).times { current = current.next }
    current.next = nil
    @last = current
    @length -= 1
    to_return
  end

  def pop_first
    to_return = @head
    @head = @head.next
    @length -= 1
    to_return
  end

  def insert(value, index)
    return prepend(value) if index.zero?
    return append(value) if index == @length
    raise(ArgumentError, 'Index out of bounds') if index > @length

    node = Node.new(value)
    current = @head
    (index - 1).times { current = current.next }
    node.next = current.next
    current.next = node
  end

  def delete(index)
    if index.zero?
      pop_first
      return
    end
    if index == @length - 1
      pop_last
      return
    end
    raise(ArgumentError, 'Index out of bounds') if index > @length - 1

    current = @head
    (index - 1).times { current = current.next }
    current.next = current.next.next
    @length -= 1
  end

  def each
    current = @head
    while current
      yield current.value
      current = current.next
    end
  end

  def [](index)
    raise(ArgumentError, 'Index out of bounds') if index >= @length

    current = @head
    index.times { current = current.next }
    current.value
  end
end

class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

def selection_sort(arr)
  find_smallest = lambda do |arr_|
    smallest = arr_[0]
    smallest_index = 0
    arr_.each_with_index do |item, index|
      if item < smallest
        smallest = item
        smallest_index = index
      end
    end
    smallest_index
  end

  new_arr = []
  n = arr.length

  n.times do
    smallest = find_smallest.call(arr)
    new_arr.push(arr.delete_at(smallest))
  end
  new_arr
end

# -------------------------------------------------
# Arrays and Linked Lists
#
# Arrays are a group of elements, stored in the memory as a contiguous block.
# This allows for "random access". A read time of O(1).
#
# However, inserting an element will require moving all existing elements
# to a new location in memory that will fit the new element. An insertion time of O(n).
#
# Linked lists are a group of elements, stored in the memory as separate objects that point to each other.
# Inserting an element only requires changing the pointers of the elements around it. An insertion time of O(1).
#
# However, reading an element will require traversing the list from the beginning
# to the desired element. A read time of O(n).
#
#
# -------------------------------------------------
# "Amortized Insertion Time"
# Ruby arrays are similar to Python lists in which they are dynamic arrays,
# meaning many things, but they both have an amortized insertion time of O(1),
# with the benefits of random access.
#
#
# -------------------------------------------------
# Excercises
#
# 2.1 Suppose you're building an app to keep track of your finances.
# Every day, you write down everything you spent.
# At the end of the month, you review your expenses and sum up how much you spent.
# Should you use an array or a linked list to keep track of your daily expenses and why?
#
# Using a linked list would be more efficient for this task. As inserting is done on the daily,
# while reading is done only once per month.
#
# 2.2 Suppose you're building an app for restaurants to take customer orders.
# Your app needs to store a list of orders. Servers keep adding orders to this list,
# and chefs take orders off the list and make them.
# Should you use an array or a linked list to implement this list of orders and why?
#
# Using a linked list would be better here as well. As adding elements to the beginning and removing
# elements from the end are both O(1) operations in lists but O(n) operations in arrays.
#
# -------------------------------------------------
# 2.3 Suppose Facebook keeps a list of usernames. When someone tries to log in,
# a search is done for their username. If it's in the list of usernames, they can log in.
# Would you use an array or a linked list to store the list of usernames?
#
# As the search operation is done frequently, and the search algorithm requires random access,
# an array would be more efficient.
#
# 2.4 People sign up for Facebook pretty often, too. Suppose you use an array to store the list of users.
# What are the downsides of an array for inserting users?
#
# Inserting users will require shifting all elements to the right to make space for the new user.
# It might also require resizing the array if it's full.
#
# 2.5 Let's consider Facebook using a hybrid of arrays and linked lists.
# An array with 26 linked lists, one for each letter of the alphabet.
# Compare this hybrid data structure to arrays and linked lists,
# is it faster or slower than each at searching and inserting?
#
# Searching would be faster than a linked list, but slower than an array.
# Inserting would be faster than an array, and using random access to determine the linked list to insert into
# it would be just as fast as a linked list.
