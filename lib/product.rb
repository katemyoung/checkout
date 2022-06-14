class Product
  attr_reader :code, :name, :price

  @@all_products = []

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
    @@all_products.push(self)
  end

  def self.all
    @@all_products
  end
end
