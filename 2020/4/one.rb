lines = File.readlines('input')
valid_passports = 0

REQUIRED_FIELDS = [
  :byr,
  :iyr,
  :eyr,
  :hgt,
  :hcl,
  :ecl,
  :pid
]

def check_valid(passport)
  pairs = passport.split(" ")
  keys = pairs.map { |pair| pair.split(":")[0] }.map(&:to_sym)
  if (REQUIRED_FIELDS - keys).empty?
    true
  else
    puts "#{passport} || MISSING #{(REQUIRED_FIELDS - keys)}"
    false
  end
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
