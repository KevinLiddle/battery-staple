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
end
