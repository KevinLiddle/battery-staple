require 'random_password'
require 'randomizer'

describe RandomPassword do

  it "generates a random password" do
    dictionary = ["a"]
    RandomPassword.new.generate(dictionary).split(" ").should include("a")
  end

  it "generates a random password of given length" do
    dictionary = ["a", "b", "c"]
    RandomPassword.generate(dictionary, Randomizer.new, 2).split(" ").length.should == 2
  end

  it "uses rand to find a random word" do
    dictionary = ["a", "b", "c"]
    num_words = 3

    password = RandomPassword.generate(dictionary, FakeRandomizer.new(2), num_words)
    password.should == "c c c"
  end
end

class FakeRandomizer

  def initialize(random_value = 0)
    @random_value = random_value
  end

  def random(ceiling)
    @random_value
  end
end
