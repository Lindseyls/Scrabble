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

      # output the score of each letter in a word
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
    end # end of def self.score(word)

    # this method finds the top word based on total_score
    def self.highest_score_from(array_of_words)
      if array_of_words.length == 0
        return nil
      elsif array_of_words.length == 1
        return array_of_words[0]
      elsif array_of_words.length > 1
        top_score = 0
        top_word = []
        array_of_words.each do |word|
          if self.score(word) > top_score
            top_score = self.score(word)
            top_word = [word]
          elsif self.score(word) == top_score
            top_word << word
          end
        end
        if top_word.length == 1
          return top_word[0]
        elsif top_word.length > 1
          if top_word[0] < top_word[1]
            return top_word[0]
          else
            return top_word[1]
          end
        end
      end
    end # end of def self.highest_score_from(array_of_words)

  end # end of Scoring class
end # end of Scrabble module 
