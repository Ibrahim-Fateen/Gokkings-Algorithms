def solution(n, arr)
  dp = Array.new(n + 1, 1)
  dp[0] = 1
  (arr.size - 1).downto(0) do |i|
    elem = arr[i]
    next if i == n - 1

    dp[i] = dp[i + 1] + 1 unless elem > arr[i + 1]
  end
  dp.max
end

n = gets.to_i
arr = gets.split.map(&:to_i)
puts solution(n, arr)

# puts solution(3, [2, 2, 9]) # 3
