# def knapsack(items, max_weight)
#   return 0 if items.empty? || max_weight.zero?
#
#   item = items.pop
#   if item[:weight] > max_weight
#     knapsack(items, max_weight)
#   else
#     knapsack(items, max_weight - item[:weight]) + item[:value]
#   end
# end
def knapsack(items, max_weight)
  dp = [0] * (max_weight + 1)

  items.each do |item|
    max_weight.downto(item[:weight]) do |weight|
      dp[weight] = [dp[weight], dp[weight - item[:weight]] + item[:value]].max
    end
  end

  dp.max
end

# to_steal = [
#   { weight: 1, value: 1500 },
#   { weight: 3, value: 2000 },
#   { weight: 4, value: 3000 },
#   { weight: 1, value: 2000 },
#   { weight: 1, value: 1000 }
# ]
#
# to_camp = [
#   { weight: 3, value: 10 },
#   { weight: 1, value: 3 },
#   { weight: 2, value: 9 },
#   { weight: 2, value: 5 },
#   { weight: 1, value: 6 }
# ]
#
# items = [
#   { weight: 2, value: 3 },
#   { weight: 1, value: 2 }
# ]
#
# puts knapsack(to_steal, 4) # 4500
# puts knapsack(to_camp, 6) # 25
# puts knapsack(items, 3) # 5
