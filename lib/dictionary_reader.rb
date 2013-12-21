class DictionaryReader
  class << self

    def read(clean = false)
      lines = File.readlines("#{File.dirname(__FILE__)}/dictionary.txt").reject do |line|
        word = get_word(line, clean)
        word.size < 4 || uppercase?(word) || profane?(line, clean)
      end
      lines.map { |line| get_word(line, clean) }
    end

    private

    def profane?(line, clean)
      line.strip.end_with?(":profane") && clean
    end

    def uppercase?(word)
      word[0].downcase != word[0]
    end

    def get_word(line, clean)
      line.strip.gsub(/:profane/, '')
    end

  end
end
