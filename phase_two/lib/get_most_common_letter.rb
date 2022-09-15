def get_most_common_letter(text)
  counter = Hash.new(0)
  text.gsub(/\W+/, '').chars.map do |char|
    counter[char] += 1
  end
  counter
  counter.to_a.sort_by { |k, v| v }.[-1][0]
end

p get_most_common_letter("the roof, the roof, the roof is on fire!")
p "o"

=begin 
Challenge: Debug this program
def get_most_common_letter(text)
  counter = Hash.new(0)
  text.chars.each do |char|
    counter[char] += 1
  end
  counter.to_a.sort_by { |k, v| v }[0][0]
end

# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"
=end