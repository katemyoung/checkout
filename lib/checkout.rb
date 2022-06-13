require "money"
Money.default_currency = Money::Currency.new("GBP")
I18n.config.available_locales = :en

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
    @basket = []
  end

  def scan(item)
    @basket.push(@@products.select{ |element| element["Product code"] == item }[0])
  end

  

  def total
    Money.from_cents(total_in_pence).format
  end

  private

  def basket
    @basket
  end

  def total_in_pence
    sum = @basket.map { |element| element["Price"].*(100) }.sum
    
  end
end
