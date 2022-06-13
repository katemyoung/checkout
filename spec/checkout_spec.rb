require "checkout"

RSpec.describe Checkout do
  describe "on initalization of a new checkout" do
    it "is expected to accpet promitional rules as an argument" do
      expect(Checkout.itself).to respond_to(:new).with(1).argument
    end 
  end

  describe "#scan" do
    it "it exists as a method" do
      promotional_rules = []
      co = Checkout.new(promotional_rules)

      expect(co).to respond_to(:scan)
    end
  end
end