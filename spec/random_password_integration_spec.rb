require "random_password"

describe "Random Password Integration" do

  it "reads from actual dictionary and creates some random passwords" do
    password = RandomPassword.generate(4)
    password.split(" ").size.should == 4
    password.include?("\n").should be_false
  end
end
