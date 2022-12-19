# Find the item type that appears in both compartments of each rucksack.
# What is the sum of the priorities of those item types?

ITEM_PROPERTIES = (?a..?z).to_a + (?A..?Z).to_a
def prio(letter) = ITEM_PROPERTIES.index(letter) + 1

rows = IO.binread("input.txt").split("\n")
points = rows.sum do |row|
  items = row.chars
  first = items.values_at(Range.new(0, (items.size/2)-1))
  second = items.values_at(Range.new(items.size/2, items.size-1))
  overlap = first & second
  raise(StandardError, "w00t: #{overlap}") unless overlap.size == 1
  prio(overlap.first)
end

puts "prio point sum: #{points}"

elf_groups = IO.binread("input.txt").split("\n").each_slice(3).to_a
puts "#{elf_groups.size} Groups"

badge_prio_points = elf_groups.sum do |group|
  first, second, third = group.map(&:chars)
  badge = (first & second & third).first
  prio(badge)
end
puts "badge prio point sum: #{badge_prio_points}"
