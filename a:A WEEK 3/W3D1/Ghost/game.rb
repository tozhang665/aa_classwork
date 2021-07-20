require 'set'
wordSet = Set.new([])

line_num=0
File.open('dictionary.txt').each do |line|
  wordSet.add(line.chomp())
end

p wordSet