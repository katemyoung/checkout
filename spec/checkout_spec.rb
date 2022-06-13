require "checkout"

RSpec.describe Checkout do
  describe "on initalization of a new checkout" do
    it "is expected to accpet promitional rules as an argument" do
      expect(Checkout.itself).to respond_to(:new).with(1).argument
    end
    it "total is nil" do
      co = Checkout.new("promotional_rules")
      
      expect(co.total).to eq(0)
    end
  end

  describe "#scan" do
    it "it accpets an item as an argument" do
      co = Checkout.new("promotional_rules")

      expect(co).to respond_to(:scan).with(1).argument
    end

    it "adds scanned item to the basket" do
      co = Checkout.new("promotional_rules")

      co.scan(001)
      co.scan(001)
      
      expect(co.basket).not_to eq([])
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

      expect(price).to eq("£54.24")
    end
  end
end
