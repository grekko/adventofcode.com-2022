require "pry"

calories_by_elf = IO.binread("input.txt").split("\n\n").each_with_object([]) do |calorie_lines, acc|
  acc << calorie_lines.split("\n").map(&:to_i).sum
end


puts "Part1: Max calories are #{calories_by_elf.max}"

top_three = calories_by_elf.sort.reverse.take(3)
puts "Part2: Sum of top three elf calories are #{top_three.sum}"
