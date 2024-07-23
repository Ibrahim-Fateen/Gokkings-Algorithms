# def x_good?(char, s)
#   n = s.length
#   if n == 1
#     return true if s[0] == char
#
#     return false
#   end
#
#   return true if x_good?(char, s[0...n / 2]) && x_good?(char, s[n / 2..])
#
#   return true if x_good?(char.next, s[0...n / 2]) && x_good?(char, s[n / 2..])
#
#   return true if x_good?(char, s[0...n / 2]) && x_good?(char.next, s[n / 2..])
#
# false
# end


def turn_good_price(char, s)
  n = s.length
  if n == 1
    return 0 if s[0] == char

    return 1
  end

  price_left = turn_good_price(char.next, s[0...n / 2]) + (n / 2) - s[n / 2..].count(char)
  price_right = turn_good_price(char.next, s[n / 2..]) + (n / 2) - s[0...n / 2].count(char)

  [price_left, price_right].min

end

# def turn_x_good_price(char, s)
#   price_center = turn_good_price_center(char, s)
#   return price_center if s.length == 1
#
#   price_left = turn_good_price_left(char, s)
#   price_right = turn_good_price_right(char, s)
#
#   [price_left, price_right, price_center].min
# end
#
# def turn_good_price_left(char, s)
#   turn_x_good_price(char.next, s[0...s.length / 2]) + turn_good_price_center(char, s[s.length / 2..])
# end
#
# def turn_good_price_right(char, s)
#   turn_good_price_center(char, s[0...s.length / 2]) + turn_x_good_price(char.next, s[s.length / 2..])
# end
#
# def turn_good_price_center(char, s)
#   s.length - s.count(char)
# end

# puts x_good?('a', 'bbdcaaaa')
#
t = gets.to_i
t.times do
  n = gets.to_i
  s = gets.chomp
  puts turn_good_price('a', s)
end

# puts turn_good_price('a', 'bbdcaaaa') # 0
# puts turn_good_price('a', 'bc') # 1
# puts turn_good_price('a', 'asdfghjk') # 7
# puts turn_good_price('a', 'ceaaaabb') # 4
# puts turn_good_price('a', 'bbaaddcc') # 5
# puts turn_good_price('a', 'z') # 1
# puts turn_good_price('a', 'a') # 0
# puts turn_good_price('a', 'zz') # 2
