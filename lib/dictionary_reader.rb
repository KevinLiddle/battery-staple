class DictionaryReader
  def self.read
    File.readlines("dictionary.txt").reject { |line| line.size < 4 || uppercase?(line) }
  end

  def self.uppercase?(word)
    word[0].downcase != word[0]
  end
end
