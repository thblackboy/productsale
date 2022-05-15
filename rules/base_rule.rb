module Rules
class BaseRule
  def initialize(products:, sale:, items:, count: 0)
    @products = products
    @count = count
    @sale = sale
    @items = items
  end

  def rest_of_items
    @items
  end

  def satisfies?
    raise "#{__method__} undefined for #{self.class}"
  end

  def works_once?(activated_discountes)
    if once?
      return !activated_discountes.include?(self.class)
    else
      return true
    end
  end

  def calculate_sum
    raise "#{__method__} undefined for #{self.class}"
  end
  protected

  def once?
    raise "#{__method__} undefined for #{self.class}"
  end
end
end
