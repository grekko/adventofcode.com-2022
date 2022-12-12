strategies = IO.binread("input.txt").split("\n")

wins = [
  %w[A Y],
  %w[B Z],
  %w[C X]
]

draws = [
  %w[A X],
  %w[B Y],
  %w[C Z]
]

losses = [
  %w[A Z],
  %w[B X],
  %w[C Y]
]

card_points = {
  "X" => 1,
  "Y" => 2,
  "Z" => 3,
}

total_score = strategies.map do |round|
  play = round.split(" ")

  extra = card_points.fetch(play.last)
  case
  when wins.include?(play) then 6 + extra
  when losses.include?(play) then 0 + extra
  when draws.include?(play) then 3 + extra
  else
    raise ArgumentError, play.inspect
  end
end.sum

puts "Total Score: #{total_score}"

# X: lose
# Y: draw
# Z: win
result_to_reaction = {
  "X" => losses,
  "Y" => draws,
  "Z" => wins,
}
points_for_result = {
  "X" => 0,
  "Y" => 3,
  "Z" => 6,
}

new_total_score = strategies.map do |round|
  elf, result = round.split(" ")
  move = result_to_reaction.fetch(result).find { |option| option.first == elf }.last

  points_for_result.fetch(result) + card_points.fetch(move)
end.sum

puts "New Total Score: #{new_total_score}"
