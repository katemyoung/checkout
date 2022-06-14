require "money"
require "product"
require_relative "../config/money"

class Checkout
  #@@products = [
  #  {
  #    "Product code" => 001,
  #    "Name" => "Lavender heart",
  #    "Price" => 9.25
  #  }, {
  #    "Product code" => 002,
  #    "Name" => "Personalised cufflinks",
  #    "Price" => 45.0
  #  }, {
  #    "Product code" => 003,
  #    "Name" => "Kids T-shirt",
  #    "Price" => 19.95
  #  }
  # ]

  def initialize(promotional_rules = [])
    @basket = []
    @current_promotions = promotional_rules
  end

  def scan(item)
    # scanned_item = @@products.select { |element| element["Product code"] == item }[0] # Product.all 
    scanned_item = Product.all.find { |product| product.code == item }
    add_to_basket(scanned_item)
  end

  def total
    calculate_grand_total
  end

  private

  attr_reader :basket, :current_promotions

  def add_to_basket(scanned_item)
    basket.push(scanned_item)
  end

  def calculate_grand_total
    total_before_discount = subtotal_in_pence
    grand_total_in_pence = apply_relevent_promotions(total_before_discount)
    format_grand_total(grand_total_in_pence)
  end

  def subtotal_in_pence
    basket.map { |element| element["Price"] * 100 }.sum
  end

  def apply_relevent_promotions(total_before_discount)
    working_total = total_before_discount
    working_total = apply_lavender_heart_multibuy_discount(total_before_discount) if lavender_heart_multibuy_discount_applicable?
    working_total = apply_ten_percent_off_over_60_pounds(working_total) if ten_percent_off_over_60_pounds_applicable?(working_total)
    working_total
  end

  def format_grand_total(total_in_pence)
    Money.from_cents(total_in_pence).format
  end

  def qty_lavender_hearts
    count = 0
    basket.each { |item| count += 1 if item["Product code"] == 001 }
    count
  end

  def apply_ten_percent_off_over_60_pounds(working_total)
    working_total * 0.9
  end

  def apply_lavender_heart_multibuy_discount(working_total)
    working_total - (75 * qty_lavender_hearts)
  end

  def lavender_heart_multibuy_discount_applicable?
    current_promotions.include?(:lavender_heart_multibuy) && qty_lavender_hearts >= 2
  end

  def ten_percent_off_over_60_pounds_applicable?(working_total)
    current_promotions.include?(:ten_percent_off_over_60_pounds) && working_total >= 6000
  end
end
