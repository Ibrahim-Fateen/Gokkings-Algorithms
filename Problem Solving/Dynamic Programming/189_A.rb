def solution(n, a, b, c)
  dp = Array.new(n + 1, -1)
  (0..n).each do |i|
    if i.zero?
      dp[i] = 0
    else
      a_position = i - a
      b_position = i - b
      c_position = i - c
      a_max = a_position >= 0 ? dp[a_position] : -1
      b_max = b_position >= 0 ? dp[b_position] : -1
      c_max = c_position >= 0 ? dp[c_position] : -1
      max = [a_max, b_max, c_max].max
      dp[i] = max >= 0 ? max + 1 : -1
    end
  end
  dp[n]
end

n, a, b, c = gets.split.map(&:to_i)
puts solution(n, a, b, c)

# puts solution(5, 5, 3, 2) # 2
# puts solution(17, 2, 3, 5) # 8
