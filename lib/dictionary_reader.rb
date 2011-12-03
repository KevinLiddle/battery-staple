class DictionaryReader
  def self.read
    words = File.readlines("#{File.dirname(__FILE__)}/dictionary.txt").reject do |line|
      line.strip.size < 4 || uppercase?(line)
    end
    words.map { |word| word.strip }
  end

  def self.uppercase?(word)
    word[0].downcase != word[0]
  end
end
