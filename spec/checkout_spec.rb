require "checkout"

RSpec.describe Checkout do
  describe "on initalization of a new checkout" do
    it "is expected to accept promotional rules as an argument" do
      expect(Checkout.itself).to respond_to(:new).with(1).argument
    end

    it "total is nil" do
      co = Checkout.new("promotional_rules")
      
      expect(co.total).to eq("£0.00")
    end
  end

  describe "#scan" do
    it "it accepts an item as an argument" do
      co = Checkout.new("promotional_rules")

      expect(co).to respond_to(:scan).with(1).argument
    end
  end

  describe "#total" do
    it "returns the total given one 001 item" do
      co = Checkout.new("promotional_rules")
      co.scan(001)

      price = co.total

      expect(price).to eq("£9.25")
    end

    it "returns the total given one 001 and one 002 item" do
      co = Checkout.new("promotional_rules")
      co.scan(001)
      co.scan(002)

      price = co.total

      expect(price).to eq("£54.25")
    end

    it "returns the total given one of each item 001 to 003 and no promotional rules" do
      co = Checkout.new("promotional_rules")
      co.scan(001)
      co.scan(002)
      co.scan(003)

      price = co.total

      expect(price).to eq("£74.20")
    end
  end
end
