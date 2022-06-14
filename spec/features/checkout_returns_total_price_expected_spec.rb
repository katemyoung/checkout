require "checkout"

RSpec.describe "checkout" do
  it "returns expected price give one of each item and >£60 10% discount" do
    promotional_rules = [:ten_percent_off_over_60_pounds]
    co = Checkout.new(promotional_rules)
    co.scan(0o01)
    co.scan(0o02)
    co.scan(0o03)

    price = co.total

    expect(price).to eq("£66.78")
  end

  it "returns expected price give two lavender hearts and when the lavender heart multibuy discount is applied" do
    promotional_rules = [:lavender_heart_multibuy]
    co = Checkout.new(promotional_rules)
    co.scan(0o01)
    co.scan(0o03)
    co.scan(0o01)

    price = co.total

    expect(price).to eq("£36.95")
  end

  it "returns expected price when both discounts are applicable" do
    promotional_rules = [:lavender_heart_multibuy, :ten_percent_off_over_60_pounds]
    co = Checkout.new(promotional_rules)
    co.scan(0o01)
    co.scan(0o02)
    co.scan(0o01)
    co.scan(0o03)

    price = co.total

    expect(price).to eq("£73.76")
  end
end
