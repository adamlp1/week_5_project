require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/product')
also_reload('../models/*')

get '/products' do
  @products = Product.all
  erb(:"products/index")
end

get '/products/new' do 
  @products = Product.all 
  erb(:"products/new")
end

post '/products' do 
  product = Product.new(params)
  product.save
  redirect to ("/products")
end

get '/products/:id' do 
  @product = Product.find(params['id'])
  erb(:"products/show")
end



# post '/products/:id/delete' do
#   product = Product.find(params['id'])
#   product.delete 
#   redirect to '/products' 
# end 
