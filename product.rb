class Product
  attr_reader :name, :price

  @@products = []
  def initialize(name, price)
    @name = name
    @price = price
    @@products << self
  end

  def self.find_item(name)
    item = @@products.select { |product| product.name == name }
    return item[0] if item.one?
  end

  def self.all
    @@products
  end

  def self.create_test_data
    #products
    Product.new("A", 10)
    Product.new("B", 20)
    Product.new("C", 30)
    Product.new("D", 40)
    Product.new("E", 50)
    Product.new("F", 60)
    Product.new("G", 70)
    Product.new("H", 80)
    Product.new("I", 90)
    Product.new("J", 100)
    Product.new("K", 110)
    Product.new("L", 120)
    Product.new("M", 130)
  end
end
