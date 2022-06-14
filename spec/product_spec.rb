require "product"

RSpec.describe Product do
  describe "on initalization of a new product" do
    it "is expected to accept product code as an arguments" do
      product = Product.new(001, "Lavender heart", 9.25)

      expect(product.code).to eq(001)
    end

    xit "is expected to accept name as an arguments" do
      product = Product.new(001, "Lavender heart", 9.25)

      expect(product.name).to eq("Lavender heart")
    end
    
    xit "is expected to accept procee as an arguments" do
      product = Product.new(001, "Lavender heart", 9.25)

      expect(product.price).to eq(9.25)
    end
  end

  describe ".all" do
  end
end