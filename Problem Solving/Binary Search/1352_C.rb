def solution(n, k)
  k + (k - 1) / (n - 1)
end

t = gets.to_i
t.times do
  n, k = gets.split.map(&:to_i)
  puts solution(n, k)
end