# Given a string s, find the longest substring t that meets all the requirements:
# s start with t
# s ends with t
# s contains t in the middle

# Example
# Input: "fixprefixsuffix"
# Output: "fix"

def solution(s)
  n = s.length

  obelix = s[1..n - 2]
  (1...n).reverse_each do |i|
    prefix = s[0...i]
    suffix = s[n - i..n]

    return prefix if prefix == suffix && obelix.include?(prefix)
  end
  'Just a legend'
end

puts solution(gets.chomp)
