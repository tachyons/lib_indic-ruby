require 'pry'
module LibIndic
  class Normalizer
    PUNCTUATIONS = ['~', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')',
                    '-', '+', '_', '=', '{', '}', '|', ':', ';', '<', '>',
                    '\,', '.', '?'].freeze
    def initialize
      rules_path = File.expand_path('../../../data/normalizer_ml.rules', __FILE__)
      @rules_file = File.open(rules_path)
      @rules_hash = {}
      load_rules
    end

    def normalize(text)
      words = text.split
      result = []
      words.each do |word|
        word = trim(word)
        word_stemmed = ''
        (-(word.length - 2)..-1).each do |index|
          sub_str = word[index..-1]
          unless @rules_hash[sub_str].nil?
            word_stemmed = word[0..(index - 1)] + @rules_hash[sub_str]
          end
        end
        word_stemmed = word if word_stemmed == ''
        result << word_stemmed
      end
      result.join(' ')
    end

    def load_rules
      @rules_file.each do |line|
        next if line.start_with? '#'
        line = line.split('#').first # Remove commented part of the line
        line = line.strip
        next if line == ''
        lhs, rhs = line.split('=')
        @rules_hash[lhs] = rhs
      end
    end

    def trim(word)
      word.strip!
      word.split(/#{PUNCTUATIONS}/).first
    end
  end
end
