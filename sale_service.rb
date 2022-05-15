require_relative './rules/buy_more_get_sale_rule'
require_relative './rules/buy_one_sale_for_another_rule'
require_relative './rules/special_products_set_sale_rule'
class SaleService
  RULES = {
    special_set_sale: Rules::SpecialSetSaleRule,
    buy_one_get_sale_for_another: Rules::BuyOneSaleForAnotherRule,
    buy_more_get_sale: Rules::BuyMoreGetSaleRule
  }.freeze
  def initialize(items, sales)
    @items = items
    @sales = sales
    @sum = 0
  end

  def call
    calculate_cost_of_dicounted_products
    calculate_cost_of_rest_of_products
  end

  def get_finally_price
    @sum
  end

  private

  def calculate_cost_of_dicounted_products
    activated_discountes = []
    @sales.each do |sale|
      rule = RULES[sale.type.to_sym].new(products: sale.products, count: sale.count, sale: sale.discount_percent,
                                         items: @items)
      next unless rule.satisfies? && rule.works_once?(activated_discountes)

      activated_discountes << rule.class
      @sum += rule.calculate_sum
      @items = rule.rest_of_items
    end
  end

  def calculate_cost_of_rest_of_products
    @items.each do |item|
      @sum += Product.find_item(item).price
    end
  end
end
