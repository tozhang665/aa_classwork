require 'set'


class WordChainer

    attr_reader :dictionary

    def initialize
        @dictionary = Set.new([])
        File.open('dictionary.txt').each do |line|
            @dictionary.add(line.chomp())
        end
    end

    def adjacent_words(word)
        adjacent_set = Set.new([])
        alpha = ('a'..'z').to_a
        word.each_char.with_index do |char,idx|
            alpha.each do |alphabet|
                portion = word+""
                portion[idx] = alphabet
                if @dictionary.include?(portion)
                    adjacent_set.add(portion)
                end
            end
            word
        end
        adjacent_set.delete(word)
        adjacent_set
    end

    def run(source,target)
        @current_words = [source]
    end
end


# d = WordChainer.new

# # p d.dictionary
# #axis
# p d.adjacent_words("cat")

