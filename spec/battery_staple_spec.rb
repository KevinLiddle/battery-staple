require 'battery_staple'

describe BatteryStaple do

  it "reads from actual dictionary and creates some random passwords" do
    password = BatteryStaple.generate(4)
    expect(password.split(" ").size).to eq(4)
    expect(password.include?("\n")).to be_falsey
  end
end
