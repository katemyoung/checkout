require "checkout"

RSpec.describe "checkout" do
  it "returns expected price give one of each item and >£60 10% discount" do
    promotional_rules = [:ten_percent_off_over_60_pounds]
    co = Checkout.new(promotional_rules)
    co.scan(001)
    co.scan(002)
    co.scan(003)

    price = co.total

    expect(price).to eq("£66.78")
  end
end
