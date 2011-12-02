require 'random_password'

describe RandomPassword do

  it "generates a random password" do
    dictionary = ["a"]
    RandomPassword.new.generate(dictionary).split(" ").should include("a")
  end

  it "generates random password of given length" do
    dictionary = ["a", "b", "c"]
    RandomPassword.new.generate(dictionary, 2).split(" ").length.should == 2
  end

  it "generates random password using randomizer" do
    dictionary = ["a", "b", "c", "d", "e"]
    num_words = 2

    password = RandomPassword.new(FakeRandomizer.new([0, 4])).generate(dictionary, num_words)
    password.should == "a e"
  end
end

class FakeRandomizer
  def initialize(random_values)
    @random_values = random_values
  end

  def random(ceiling)
    @random_values.shift
  end
end
