require 'random_password'
require 'dictionary_reader'

class BatteryStaple
  def self.generate(num_words, clean = false)
    dictionary = DictionaryReader.read(clean)
    RandomPassword.new.generate(dictionary, num_words)
  end
end
