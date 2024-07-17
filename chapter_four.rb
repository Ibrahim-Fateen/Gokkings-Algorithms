# frozen_string_literal: true

def split_farm(length, width)
  width.zero? ? length : split_farm(width, length % width)
end

def sum(arr)
  return 0 if arr.empty?

  arr.pop + sum(arr)
end

def count(arr)
  return 0 if arr.empty?

  arr.pop
  1 + count(arr)
end

def max(arr)
  return arr.first if arr.length == 1

  last = arr.pop
  max_last = max(arr)

  last > max_last ? last : max_last
end

def binary_search_recursive(arr, target, left = 0, right = arr.length - 1)
  return nil if left > right

  mid = (left + right) / 2
  guess = arr[mid]

  return mid if guess == target

  if guess > target
    binary_search_recursive(arr, target, left, mid - 1)
  else
    binary_search_recursive(arr, target, mid + 1, right)
  end
end

def quick_sort(arr)
  return arr if arr.length < 2

  pivot = arr.shift
  less, greater = arr.partition { |el| el <= pivot }

  quick_sort(less) + [pivot] + quick_sort(greater)
end
