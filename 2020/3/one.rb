lines = File.readlines('input')

right = 3

trees = 0

lines.each_with_index do |line, index|
  position = (index * right) % (line.length - 1)
  puts "index: #{index}, position: #{position}, tree?: #{line[position] == '#'}"
  if line[position] == '#'
    trees += 1
  end
end

puts "TOTAL TREES: #{trees}"
