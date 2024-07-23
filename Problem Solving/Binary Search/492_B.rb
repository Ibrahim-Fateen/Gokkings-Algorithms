# Vanya walks late at night along a straight street of length l, lit by n lanterns.
# Consider the coordinate system with the beginning of the street corresponding to the point 0, and its end corresponding to the point l.
# Then the i-th lantern is at the point ai.
# The lantern lights all points of the street that are at the distance of at most d from it, where d is some positive number, common for all lanterns.
#
# Vanya wonders: what is the minimum light radius d should the lanterns have to light the whole street?

def solution(n, l, arr)
  arr.sort!
  max_distance = arr[0]

  (0..n - 2).each do |i|
    distance = (arr[i + 1] - arr[i]) / 2.0
    max_distance = distance if distance > max_distance
  end

  last_distance = l - arr[-1]
  max_distance = last_distance if last_distance > max_distance
  max_distance
end

first_line = gets
second_line = gets

n, l = first_line.split.map(&:to_i)
arr = second_line.split.map(&:to_i)

puts solution(n, l, arr)
