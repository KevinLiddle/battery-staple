require "random_password"

describe BatteryStaple do

  it "reads from actual dictionary and creates some random passwords" do
    password = BatteryStaple.generate(4)
    password.split(" ").size.should == 4
    password.include?("\n").should be_false
  end
end
