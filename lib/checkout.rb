class Checkout
  @@products = {
    "Product code" => 001, 
    "Name" => "Lavender heart",
    "Price" => "£9.25"
    }

  def initialize(promotional_rules)
  end

  def scan(item)
  end

  def total
    @@products["Price"]
  end
end
