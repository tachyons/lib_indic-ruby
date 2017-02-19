module LibIndic
  class Normalizer
    PUNCTUATIONS = ['~', '!', '@', '#', '$', '%', '^', '&', '*','(', ')',
                    '-', '+', '_', '=', '{', '}', '|',':', ';', '<', '>',
                    '\,', '.', '?']
    def initialize()
      rules_path = File.expand_path("../../../data/normalizer_ml.rules", __FILE__)
      @rules_file = File.open(rules_path)
      @rules_hash = {}
    end

    def normalize(text)

    end

    def load_rules
      @rules_file.each do |line|
        next if line.start_with? '#'
        line = line.split("#").first # Remove commented part of the line
        line = line.strip
        next if line == ""
        lhs, rhs = line.split("=")
        @rules_hash[lhs] = rhs
      end
    end

    def trim(word)
    end
  end
end
