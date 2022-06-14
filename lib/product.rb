class Product
  attr_reader :code, :name

  def initialize(code, name, price)
    @code = code
    @name = name
  end
end
