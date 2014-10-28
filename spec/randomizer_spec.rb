require 'randomizer'

describe Randomizer do
  it "uses Kernel#rand" do

    expect(Kernel).to receive(:rand).with(222).and_return(0)

    expect(Randomizer.new.random(222)).to eq(0)
  end
end
