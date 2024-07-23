# Limak is going to participate in a contest on the last day of the 2016.
# The contest will start at 20:00 and will last four hours, exactly until midnight.
# There will be n problems, sorted by difficulty, i.e. problem 1 is the easiest and problem n is the hardest.
# Limak knows it will take him 5·i minutes to solve the i-th problem.
#
# Limak's friends organize a New Year's Eve party and Limak wants to be there at midnight or earlier.
# He needs k minutes to get there from his house, where he will participate in the contest first.
#
# How many problems can Limak solve if he wants to make it to the party?

def solution(n, k)
  limit = 240 - k

  l = 0
  r = n
  while l < r
    m = (l + r + 1) / 2
    if 5 * m * (m + 1) / 2 <= limit
      l = m
    else
      r = m - 1
    end
  end
  l
end

first_line = gets
n, k = first_line.split.map(&:to_i)

puts solution(n, k)
