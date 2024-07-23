EVEN = 0
ODD = 1

def solution(n, arr)
  # sums = Array.new(n) { Array.new(n, [0, 0]) }
  sums = Array.new(n) { [0, 0] } ########################################


  base_sum = 0
  arr.each_with_index { |num, index| base_sum += num if index.even? }

  max_sum = base_sum

  (0..n).each do |start_index|
    (start_index...n).each do |end_index|
      even_sum = 0
      odd_sum = 0
      if start_index.zero?
        arr[start_index..end_index].each_with_index do |num, index|
          even_sum += num if index.even?
          odd_sum += num if index.odd?
        end
      else
        even_sum = sums[start_index][EVEN]
        odd_sum = sums[start_index][ODD]
        if end_index.even?
          even_sum += arr[end_index]
        else
          odd_sum += arr[end_index]
        end
      end
      total_sum = if start_index == end_index || (end_index - start_index).even?
                    base_sum
                  else
                    base_sum - even_sum + odd_sum
                  end
      sums[start_index] = [even_sum, odd_sum]
      max_sum = total_sum if total_sum > max_sum
    end
  end
  max_sum
end

t = gets.to_i
t.times do
  n = gets.to_i
  arr = gets.split.map(&:to_i)
  puts solution(n, arr)
end

# puts solution(4, [3, 1, 2, 1]) # 5
# puts solution(5, [1, 2, 3, 4, 5]) # 11
# puts solution(5, [1, 2, 1, 2, 1]) # 5
