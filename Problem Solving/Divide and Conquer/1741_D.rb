def solution(p_arr)
  price, = sorting_price(p_arr)
  price
end

def sorting_price(p_arr)
  return [0, p_arr] if p_arr.length == 1

  left_price, left_arr = sorting_price(p_arr[0...p_arr.length / 2])
  right_price, right_arr = sorting_price(p_arr[p_arr.length / 2..])

  if right_price == -1 || left_price == -1
    return [-1, []]
  end

  price = 0
  if right_arr.first < left_arr.first
    price = 1
    left_arr, right_arr = right_arr, left_arr
  end

  if left_arr.last > right_arr.first
    return [-1, []]
  end

  [price + left_price + right_price, left_arr + right_arr]
end

t = gets.to_i
t.times do
  m = gets.to_i
  p_arr = gets.split.map(&:to_i)
  puts solution(p_arr)
end
