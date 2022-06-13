require "checkout"

RSpec.describe Checkout do
  describe "on initalization of a new checkout" do
    it "is expected to accpet promitional rules as an argument" do
      expect(Checkout.itself).to respond_to(:new).with(1).argument
    end 
  end
end