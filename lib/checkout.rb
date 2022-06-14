require "money"
require_relative "../config/money.rb"

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
    scanned_item = @@products.select{ |element| element["Product code"] == item }[0]
    add_to_basket(scanned_item)
  end

  def total
    Money.from_cents(total_in_pence).format
  end

  private

  def basket
    @basket
  end

  def add_to_basket(scanned_item)
    basket.push(scanned_item)
  end

  def total_in_pence
    sum = basket.map { |element| element["Price"].*(100) }.sum
  end
end
