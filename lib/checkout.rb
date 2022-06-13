class Checkout
  @@products = [
    {
      "Product code"=>001, 
      "Name"=>"Lavender heart", 
      "Price"=>9.25
    }, {
      "Product code"=>002,
      "Name"=>"Personalised cufflinks",
      "Price"=>45.0
    }, {
      "Product code"=>003,
      "Name"=>"Kids T-shirt",
      "Price"=>19.95
    }
  ]

  def initialize(promotional_rules)
  end

  def scan(item)
    @@products.select{ |element| element["Product code"] == item }[0]
  end

  def total
    # "£" + @@products["Price"].to_s
  end
  
  private 

  def basket
   
  end
end
