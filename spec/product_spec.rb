require "product"

RSpec.describe Product do
  describe "on initalization of a new product" do
    it "is expected to accept product code as an arguments" do
      product = Product.new(0o01, "Lavender heart", 9.25)

      expect(product.code).to eq(0o01)
    end

    it "is expected to accept name as an arguments" do
      product = Product.new(0o01, "Lavender heart", 9.25)

      expect(product.name).to eq("Lavender heart")
    end

    it "is expected to accept procee as an arguments" do
      product = Product.new(0o01, "Lavender heart", 9.25)

      expect(product.price).to eq(9.25)
    end
  end

  describe ".all" do
    it "returns an array of all products" do
      Product.new(0o01, "Lavender heart", 9.25)

      all_products = Product.all

      expect(all_products).to be_an(Array)
    end
  end
end
