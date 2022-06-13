require "checkout"

RSpec.describe "checkout" do
  it "returns expected price give one 001 item" do
    promotional_rules = []
    co = Checkout.new(promotional_rules)
    co.scan(001)

    price = co.total

    expect(price).to eq("9.25")
  end

  xit "returns expected price give one of each item" do
    promotional_rules = []
    co = Checkout.new(promotional_rules)
    co.scan(001)
    co.scan(002)
    co.scan(003)

    price = co.total

    expect(price).to eq("£66.78")
  end
end