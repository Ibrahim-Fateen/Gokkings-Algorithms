def binary_search(arr, target)
  left = 0
  right = arr.length - 1

  while left <= right
    mid = (left + right) / 2
    guess = arr[mid]

    return mid if guess == target

    if guess > target
      right = mid - 1
    else
      left = mid + 1
    end
  end
end

# 1.1 Suppose you have a sorted list of 128 names, and you're searching through it using binary search.
# What's the maximum number of steps it would take?
# Answer: log2(128) = 7 steps
#
# 1.2 Suppose you double the size of the list.
# What's the maximum number of steps now?
# Answer: One more step than the previous answer, so 8 steps
#
# Give a runtime in Big O notation for the following.
#
# 1.3 You have a name, and you want to find the person's phone number in the phone book.
# Answer: O(log n)
#
# 1.4 You have a phone number, and you want to find the person's name in the phone book.
# Answer: O(n)
#
# 1.5 You want to read the numbers of every person in the phone book.
# Answer: O(n)
#
# 1.6 You want to read the numbers of just the As.
# Answer: O(n) - worst case is all entries in the phone book are As.


# Travelling Salesperson problem - where the goal is find the shortest path to visit every city in any order.
# Most known NP-complete problem (non-deterministic polynomial)
