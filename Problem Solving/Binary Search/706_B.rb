# Vasiliy likes to rest after a hard work, so you may often meet him in some bar nearby.
# As all programmers do, he loves the famous drink "Beecola", which can be bought in n different shops in the city.
# It's known that the price of one bottle in the shop i is equal to xi coins.
#
# Vasiliy plans to buy his favorite drink for q consecutive days.
# He knows, that on the i-th day he will be able to spent mi coins.
# Now, for each of the days he want to know in how many different shops he can buy a bottle of "Beecola".

def solution(prices, money)
  # find first number in prices array less than or equal to money
  # return index of that number + 1
  left = 0
  right = prices.length - 1

  while left <= right
    mid = (left + right) / 2
    guess = prices[mid]

    if guess <= money
      left = mid + 1
    else
      right = mid - 1
    end
  end
  left

end

n = gets.to_i
prices = gets.split.map(&:to_i).sort
q = gets.to_i
q.times do |_|
  money = gets.to_i
  puts solution(prices, money)
end
