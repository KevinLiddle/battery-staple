require 'randomizer'

describe Randomizer do
  it "uses Kernel#rand" do

    Kernel.should_receive(:rand).with(222).and_return(0)

    Randomizer.new.random(222).should == 0
  end
end
