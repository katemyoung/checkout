require "checkout"

RSpec.describe "checkout" do
  it "returns expected price give one of each item and >£60 10% discount" do
    promotional_rules = []
    co = Checkout.new(promotional_rules)
    co.scan(001)
    co.scan(002)
    co.scan(003)

    price = co.total

    expect(price).to eq("£66.78")
  end
end
