def solution(n, m)
  return n - m if n >= m

  if (n - 1) * 2 >= m
    solution(n - 1, m) + 1
  else
    solution(n * 2, m) + 1
  end
end

n, m = gets.split.map(&:to_i)
puts solution(n, m)
