require "checkout"

RSpec.describe Checkout do
  describe "on initalization of a new checkout" do
    it "is expected to accept promotional rules as an argument" do
      expect(Checkout.itself).to respond_to(:new).with(1).argument
    end

    it "total is nil" do
      co = Checkout.new

      expect(co.total).to eq("£0.00")
    end
  end

  describe "#scan" do
    it "it accepts an item as an argument" do
      promotional_rules = [:ten_percent_off_over_60_pounds]
      co = Checkout.new(promotional_rules)

      expect(co).to respond_to(:scan).with(1).argument
    end
  end

  describe "#total" do
    it "returns the total given one 001 item" do
      Product.new(0o01, "Lavender heart", 9.25)
      co = Checkout.new
      co.scan(0o01)

      price = co.total

      expect(price).to eq("£9.25")
    end

    it "returns the total given one 001 and one 002 item" do
      Product.new(0o01, "Lavender heart", 9.25)
      Product.new(0o02, "Personalised cufflinks", 45.00)
      co = Checkout.new
      co.scan(0o01)
      co.scan(0o02)

      price = co.total

      expect(price).to eq("£54.25")
    end

    describe "when passed the ten_percent_off_over_60_pounds promotional rule as an argument" do
      it "applies 10% discount to a basekt subtotal of £70" do
        promotional_rules = [:ten_percent_off_over_60_pounds]
        co = Checkout.new(promotional_rules)
        allow(co).to receive(:subtotal_in_pence).and_return(7000)

        price = co.total

        expect(price).to eq("£63.00")
      end
    end

    describe "when passed the :lavender_heart_multibuy preomotional rule as an argument" do
      it "reduces the price of the lavender hearts from £9.25 to £8.50" do
        Product.new(0o01, "Lavender heart", 9.25)
        Product.new(0o02, "Personalised cufflinks", 45.00)
        promotional_rules = [:lavender_heart_multibuy]
        co = Checkout.new(promotional_rules)
        co.scan(0o01)
        co.scan(0o01)

        price = co.total

        expect(price).to eq("£17.00")
      end
    end
  end
end
