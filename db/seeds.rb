require_relative('../models/product.rb')

product1 = Product.new({
  'name' => 'Rail Wax (x3)',
  'description' => '3 pack of Rail Wax cubes.',
  'stock' => 15,
  'buy_cost' => 1,
  'sell_price' => 3.50
})

product1.save
