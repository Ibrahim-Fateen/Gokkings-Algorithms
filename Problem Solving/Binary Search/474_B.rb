# It is lunch time for Mole.
# His friend, Marmot, prepared him a nice game for lunch.
#
# Marmot brought Mole n ordered piles of worms such that i-th pile contains ai worms.
# He labeled all these worms with consecutive integers: worms in first pile are labeled with numbers 1 to a1, worms in second pile are labeled with numbers a1+1 to a1+a2 and so on.
# See the example for a better understanding.
#
# Mole can't eat all the worms (Marmot brought a lot) and, as we all know, Mole is blind, so Marmot tells him the labels of the best juicy worms.
# Marmot will only give Mole a worm if Mole says correctly in which pile this worm is contained.
#
# Poor Mole asks for your help.
# For all juicy worms said by Marmot, tell Mole the correct answers.

def solution(piles, worms)
  prefix_sum = [0]
  piles.each { |pile| prefix_sum << prefix_sum[-1] + pile }
  result = []
  # for each worm, search in prefix_sum for the largest number less than or equal to the worm
  worms.each do |worm|
    left = 0
    right = piles.length
    while left < right
      mid = (left + right) / 2
      if prefix_sum[mid] < worm
        left = mid + 1
      else
        right = mid
      end
    end
    result << left
  end
  result
end

n = gets.to_i
piles = gets.split.map(&:to_i)
m = gets.to_i
worms = gets.split.map(&:to_i)

solution(piles, worms).each { |ans| puts ans }
