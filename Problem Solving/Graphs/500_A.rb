def solution(target, portals, n)
  curr_index = 0
  target -= 1
  while curr_index < n
    curr_index += portals[curr_index]

    if curr_index == target
      puts 'YES'
      return
    end
    break if curr_index > target
  end
  puts 'NO'
end

n, target = gets.split.map(&:to_i)
portals = gets.split.map(&:to_i)
solution(target, portals, n)
