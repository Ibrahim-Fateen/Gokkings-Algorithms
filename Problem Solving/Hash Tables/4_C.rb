def solution(n)
  hash = {}
  n.times do
    name = gets.chomp
    if hash[name]
      hash[name] += 1
      puts "#{name}#{hash[name] - 1}"
    else
      hash[name] = 1
      puts 'OK'
    end
  end
end

n = gets.to_i
solution(n)
