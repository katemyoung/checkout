require "checkout"

RSpec.describe Checkout do
  describe "on initalization of a new checkout" do
    it "is expected to accpet promitional rules as an argument" do
      expect(Checkout.itself).to respond_to(:new).with(1).argument
    end
  end

  describe "#scan" do
    it "it accpets an item as an argument" do
      co = Checkout.new("promotional_rules")

      expect(co).to respond_to(:scan).with(1).argument
    end

    it "returns the item hash refered to by the product code" do
      co = Checkout.new("promotional_rules")

      scanned_item = co.scan(001)
      
      expect(scanned_item).to eq({"Product code"=>1, "Name"=>"Lavender heart", "Price"=>9.25})
    end
  end

  describe "#total" do
    it "returns the total given one 001 item" do
      co = Checkout.new("promotional_rules")
      co.scan(001)

      price = co.total

      expect(price).to eq("£9.25")
    end

    xit "returns the total given one 001 and one 002 item" do
      co = Checkout.new("promotional_rules")
      co.scan(001)
      co.scan(002)

      price = co.total

      expect(price).to eq("£54.24")
    end
  end
end
