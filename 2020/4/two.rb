lines = File.readlines('input')
valid_passports = 0

REQUIRED_FIELDS = [
  'byr',
  'iyr',
  'eyr',
  'hgt',
  'hcl',
  'ecl',
  'pid'
]

def check_valid(passport)
  pairs = passport.split(" ").map do |pair|
    pair.split(":", 2)
  end.to_h
  return false unless (REQUIRED_FIELDS - pairs.keys).empty?

  return false if pairs['byr'].to_i < 1920 || pairs['byr'].to_i > 2002

  return false if pairs['iyr'].to_i < 2010 || pairs['iyr'].to_i > 2020

  return false if pairs['eyr'].to_i < 2020 || pairs['eyr'].to_i > 2030

  unit = pairs['hgt'].chars.last(2).join
  if unit == "cm"
    height = pairs['hgt'].chop.chop.to_i
    return false if height < 150 || height > 193
  elsif unit == "in"
    height = pairs['hgt'].chop.chop.to_i
    return false if height < 59 || height > 76
  else
    return false
  end

  return false if pairs['hcl'].chars.first != '#'

  true
end

passport = ""
lines.each do |line|
  if line == "\n"
    valid = check_valid(passport)
    valid_passports += 1 if valid
    passport = ""
  else
    passport << line.gsub("\n", " ")
  end
end

puts "VALID PASSPORTS: #{valid_passports}"
