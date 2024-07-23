# We know that prime numbers are positive integers that have exactly two distinct positive divisors.
# Similarly, we'll call a positive integer t Т-prime, if t has exactly three distinct positive divisors.

# You are given an array of n positive integers. For each of them determine whether it is Т-prime or not.

def solution(arr)
  max = arr.max
  primes = Array.new(max + 1, true)
  primes[0] = primes[1] = false

  (2..Math.sqrt(max)).each do |i|
    next unless primes[i]

    (i * i..max).step(i) { |j| primes[j] = false }
  end

  arr.map do |num|
    sqrt = Math.sqrt(num).to_i
    sqrt * sqrt == num && primes[sqrt] ? true : false
  end
end

n = gets.to_i
arr = gets.split.map(&:to_i)

solution(arr).each { |ans| ans ? puts('YES') : puts('NO') }
