require_relative 'base_rule'
class Rules::BuyOneSaleForAnotherRule < Rules::BaseRule
  def once?
    false
  end

  def satisfies?
    return false unless @items.include?(@products[0])
    @products[1..@products.length].each do |product|
      return true if @items.include?(product)
    end
  end

  def calculate_sum
    sum = 0
    while satisfies?
      sum += Product.find_item(@products[0]).price
      discount_price = 0
      @items.delete_at(@items.find_index(@products[0]))
      @products[1..@products.length].each do |product|
        if @items.include?(product)
          discount_price = Product.find_item(product).price - (Product.find_item(product).price * @sale).to_f / 100
          @items.delete_at(@items.index(product))
          break
        end
      end
      sum += discount_price
    end
    sum
  end
end
