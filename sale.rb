class Sale
  attr_reader :title, :type, :products, :count, :discount_percent

  @@sales = []

  def initialize(title:, type:, discount_percent:, products: [], count: 0)
    @title = title
    @type = type
    @products = products
    @count = count
    @discount_percent = discount_percent
    @@sales << self
  end

  def self.all
    @@sales
  end

  def self.create_test_data
    Sale.new(title: "AB sale 10", type: "special_set_sale", discount_percent: 10, products: ["A","B"])
    Sale.new(title: "DE sale 5", type: "special_set_sale", discount_percent: 5, products: ["D","E"])
    Sale.new(title: "EFG sale 5", type: "special_set_sale", discount_percent: 5, products: ["E","F","G"])
    Sale.new(title: "Buy A get sale 5% to K or L or M", type: "buy_one_get_sale_for_another", discount_percent: 5, products: ["A","K","L","M"])
    Sale.new(title: "Buy 3 items except A and C and get sale 5%", type: "buy_more_get_sale", discount_percent: 5, products: ["A","C"], count: 3)
    Sale.new(title: "Buy 4 items except A and C and get sale 10%", type: "buy_more_get_sale", discount_percent: 10, products: ["A","C"], count: 4)
    Sale.new(title: "Buy 5 items except A and C and get sale 20%", type: "buy_more_get_sale", discount_percent: 20, products: ["A","C"], count: 5)
  end
end
