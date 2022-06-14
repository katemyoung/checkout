require "money"
require_relative "../config/money.rb"

class Checkout
  attr_reader :current_promotions

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

  def initialize(promotional_rules=[])
    @basket = []
    @current_promotions = promotional_rules
  end

  def scan(item)
    scanned_item = @@products.select{ |element| element["Product code"] == item }[0]
    add_to_basket(scanned_item)
  end

  def total
    calculate_grand_total
  end

  private

  def basket
    @basket
  end

  def add_to_basket(scanned_item)
    basket.push(scanned_item)
  end

  def calculate_grand_total
    total_before_discount = subtotal_in_pence 
    grand_total_in_pence = apply_relevent_promotions(total_before_discount)
    format_grand_total(grand_total_in_pence)
  end

  def subtotal_in_pence
    basket.map { |element| element["Price"]*100 }.sum
  end

  def apply_relevent_promotions(total_before_discount)
    ## need to refactor this 
    # if (@current_promotions.include?(:ten_percent_off_over_60_pounds) && @current_promotions.include?(:lavender_heart_multibuy)) 

    elsif (@current_promotions.include?(:ten_percent_off_over_60_pounds) && total_before_discount >= 6000)
      total_before_discount * 0.9
    elsif (@current_promotions.include?(:lavender_heart_multibuy) && qty_lavender_hearts >= 2)
      total_before_discount - (75 * qty_lavender_hearts)
    else
      total_before_discount
    end
  end

  def format_grand_total(total_in_pence)
    Money.from_cents(total_in_pence).format
  end

  def qty_lavender_hearts
    count = 0
    basket.each {|item| count += 1 if item["Product code"] == 001 }
    count
  end
end
