require_relative 'base_rule'
class Rules::BuyMoreGetSaleRule < Rules::BaseRule
  def once?
    true
  end

  def satisfies?
    counter = 0
    @items.each do |item|
      counter += 1 unless @products.include?(item)
    end
    counter == @count
  end

  def calculate_sum
    sum = 0
    @items.each_with_index do |item, index|
      unless @products.include?(item)
        sum += Product.find_item(item).price
        @items[index] = nil
      end
    end
    @items.compact!
    sum -= (sum * @sale).to_f / 100
  end
end
