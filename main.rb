require_relative 'product'
require_relative 'sale'
require_relative 'sale_service'
class Main
  Product.create_test_data
  Sale.create_test_data
  puts 'список скидок'
  Sale.all.each do |sale|
    puts sale.title
  end
  puts 'список продуктов'
  Product.all.each do |product|
    puts "#{product.name} - #{product.price}"
  end
  print 'Введите список продуктов: '
  items = gets.chomp.scan(/\w/)
  sale_service = SaleService.new(items, Sale.all)
  sale_service.call
  puts "Окончательная стоимость #{sale_service.get_finally_price}"
end
