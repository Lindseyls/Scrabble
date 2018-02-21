require 'awesome_print'
require 'pry'

module Scrabble
  class Scoring

    def self.score(word)
      total_score = 0

      # if statement to check if the word has bad characters and space
      if /[[\W][\s]+?]/.match(word)
        return nil
      end

      # if word only has good character then the below will execute
      scrabble_word = word.split(//)
      if scrabble_word.length > 7 || scrabble_word.length == 0
        return nil
      elsif scrabble_word.length == 7
        total_score += 50
      end

      scrabble_word.each do |letter|
        case letter.downcase
        when "a", "e", "i", "o", "u", "l", "n", "r", "s", "t"
          total_score += 1
        when "d", "g"
          total_score += 2
        when "b", "c", "m", "p"
          total_score += 3
        when "f", "h", "v", "w", "y"
          total_score += 4
        when "k"
          total_score += 5
        when "j", "x"
          total_score += 8
        when "q", "z"
          total_score += 10
        end
      end
      return total_score
    end


    def self.highest_score_from(array_of_words)
      if array_of_words.length == 0
        return nil
      # if new_array = array_of_words.map { |word| word.length == 7}
      #   # binding.pry
      #   word_array = []
      #   new_array.each do |scrabble_word|
      #     word_hash = {}
      #     word_hash[:word] = scrabble_word
      #     word_hash[:length] = scrabble_word.length
      #     word_hash[:score] = self.score(scrabble_word)
      #     word_array << word_hash
      #   end
      #   return word_array
        # max = 50
        # highest_word = []
        # word_array.each do |scrabble_hash|
        #   if scrabble_hash[:score] > max
        #     highest_word.push(scrabble_hash[:word], scrabble_hash[:score])
        #     # elsif scrabble_hash[:length] == 7
        #     #   highest_word = scrabble_hash[:word]
        #     return highest_word
        #   end # if statement to find the max score
        # end # each loop to iterate through the array of words
      end # if statement using map to find 7 letter words
    end # def self.highest_score_from(array_of_words)

  end # class Scoring
end # module Scrabble



# test_chart = Scrabble::Scoring.score('')
# ap test_chart

test_chart = Scrabble::Scoring.highest_score_from(["dog", "cat", "elephan", "seventh", "rabbit"])
ap test_chart


# # array reference
# scrabble_chart = [
#   { 1 => %w[A E I O U L N R S T a e i o u l n r s t] },
#   { 2 => %w[D G d g]},
#   { 3 => %w[B C M P b c m p]},
#   { 4 => %w[F H V W Y f h v w y]},
#   { 5 => %w[K k]},
#   { 8 => %w[J X j x]},
#   { 10 => %w[Q Z q z]}
# ]
# ap scrabble_chart[0].values[0][0]
