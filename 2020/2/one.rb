lines = File.readlines('input')

valid_count = 0

lines.each do |line|
  range = line.split(' ')[0]
  letter = line.split(' ')[1][0]
  password = line.split(' ')[2]

  lower_range = range.split('-')[0].to_i
  upper_range = range.split('-')[1].to_i

  if password.count(letter) >= lower_range && password.count(letter) <= upper_range
    valid_count += 1
  end
end

puts "VALID PASSWORDS: #{valid_count}"
