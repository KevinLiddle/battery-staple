require 'randomizer'
require 'dictionary_reader'

class RandomPassword

  def initialize(randomizer = Randomizer.new)
    @randomizer = randomizer
  end

  def generate(dictionary, num_words=1)
    num_words.times.reduce("") do |password, _|
      key = @randomizer.random(dictionary.length)
      "#{password} #{dictionary[key]}"
    end.strip
  end
end
