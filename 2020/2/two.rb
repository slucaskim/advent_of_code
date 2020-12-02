lines = File.readlines('input')

valid_count = 0

lines.each do |line|
  positions = line.split(' ')[0]
  letter = line.split(' ')[1][0]
  password = line.split(' ')[2]

  p1 = positions.split('-')[0].to_i - 1
  p2 = positions.split('-')[1].to_i - 1

  next if password[p1] != letter && password[p2] != letter
  next if password[p1] == letter && password[p2] == letter

  valid_count += 1
end

puts "VALID PASSWORDS: #{valid_count}"
