module LibIndic
  class Normalizer
    def initialize()
      rules_path = File.expand_path("../../../data/normalizer_ml.rules", __FILE__)
      @rules_file = File.open(rules_path)
      @rules_hash = {}
    end
    def normalize(text)

    end
  end
end
