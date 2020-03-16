require_relative('../models/product.rb')
require_relative('../models/manufacturer.rb')


Product.delete_all
Manufacturer.delete_all

manufacturer1 = Manufacturer.new({
  'name' => 'Etnies'
})

manufacturer2 = Manufacturer.new({
  'name' => 'Element'
})


manufacturer1.save
manufacturer2.save

product1 = Product.new({
  'name' => 'Rail Wax (x3)',
  'description' => '3 pack of Rail Wax cubes.',
  'stock' => 15,
  'buy_cost' => 1,
  'sell_price' => 3.50
})

product2 = Product.new({
  'name' => '4 Board Bolts (x4)',
  'description' => '4 pack of Board Bolts.',
  'stock' => 15,
  'buy_cost' => 3,
  'sell_price' => 7
})

product2 = Product.new({
  'name' => '4 Board Bolts (x4)',
  'description' => '4 pack of Board Bolts.',
  'stock' => 15,
  'buy_cost' => 3,
  'sell_price' => 7
})




product1.save
product2.save
