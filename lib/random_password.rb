require 'randomizer'
require 'dictionary_reader'

class RandomPassword

  def initialize(randomizer = Randomizer.new)
    @randomizer = randomizer
  end

  def generate(dictionary, num_words=1)
    password = []
    num_words.times do
      key = @randomizer.random(dictionary.length)
      password << dictionary[key]
    end
    password.join(" ")
  end

  def self.generate(num_words)
    dictionary = DictionaryReader.read
    RandomPassword.new.generate(dictionary, num_words)
  end
end
