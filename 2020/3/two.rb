lines = File.readlines('input')

rights = [1, 3, 5, 7, 1]
downs = [1, 1, 1, 1, 2]

tree_counts = []

(0..4).each do |slope|
  trees = 0

  lines.each_with_index do |line, index|
    next if (index % downs[slope]) != 0
    position = (index * rights[slope] / downs[slope]) % (line.length - 1)
    puts "index: #{index}, position: #{position}, tree?: #{line[position] == '#'}"
    if line[position] == '#'
      trees += 1
    end
  end

  puts "TREES FOR #{rights[slope]}, #{downs[slope]}: #{trees}"
  tree_counts << trees
end

puts "PRODUCT: #{tree_counts.inject(&:*)}"
