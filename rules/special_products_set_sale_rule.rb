require_relative 'base_rule'
class Rules::SpecialSetSaleRule < Rules::BaseRule
  def once?
    false
  end

  def satisfies?
    satisfies = true
    @products.each do |product|
      unless @items.include?(product)
        satisfies = false
        break
      end
    end
    satisfies
  end

  def calculate_sum
    sum = 0
    while satisfies?
      price = 0
      @products.each do |product|
        price += Product.find_item(product).price
        @items.delete_at(@items.index(product))
      end
      price -= (price * @sale).to_f / 100
      sum += price
    end
    sum
  end
end
