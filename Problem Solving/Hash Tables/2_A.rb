# def solution(n)
#   scores = {}
#   n.times do
#     name, score = gets.split
#     # if scores[name].nil?
#     #   scores[name] = {score: score, }
#     # end
#     scores[name] = scores[name].to_i + score.to_i
#     if scores[:max]
#       if scores[name] > scores[:max][value]
#         scores[:max][names] = [[name, true]]
#         scores[:max][value] = scores[name]
#       elsif scores[name] == scores[:max][value]
#         scores[:max] << [name, true]
#       end
#       # scores[:max] = name if scores[name] > scores[scores[:max]]
#     else
#       scores[:max][value] = score
#       scores[:max][names] = [[name, true]]
#     end
#   end
#
#   puts scores[:max]
# end
#

def solution(n)
  scores = {}

  n.times do |turn|
    name, score = gets.split
    if scores[name].nil?
      scores[name] = { score: score.to_i, max_score: score.to_i, top_turn: turn }
    else
      scores[name][:score] = scores[name][:score].to_i + score.to_i
      if scores[name][:score] > scores[name][:max_score]
        scores[name][:max_score] = scores[name][:score]
        scores[name][:top_turn] = turn
      end
    end
  end

  max_score = 0
  first_round = 0
  top_player = ''
  scores.each_pair do |name, data|
    if data[:score] > max_score
      max_score = data[:score]
      first_round = data[:top_turn]
      top_player = name
    elsif data[:score] == max_score && data[:top_turn] < first_round
      first_round = data[:top_turn]
      top_player = name
    end
  end
  top_player
end

n = gets.to_i
puts solution(n)
