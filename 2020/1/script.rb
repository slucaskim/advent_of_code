lines = File.readlines('input').map(&:to_i)

(0..(lines.count - 1)).each do |first_index|
  first = lines[first_index]
  ((first_index + 1)..(lines.count - 1)).each do |second_index|
    second = lines[second_index]
    ((second_index + 1)..(lines.count - 1)).each do |third_index|
      third = lines[third_index]
      if (first + second + third) == 2020
        puts "MATCH: #{first} * #{second} * #{third}"
        answer = first * second * third
        puts "ANSWER: #{answer}"
      end
    end
  end
end
