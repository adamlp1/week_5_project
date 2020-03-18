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

get '/products/:id/edit' do 
  @product = Product.find(params['id'])
  erb(:"products/edit")
end

post '/products/:id' do 
  product = Product.new(params)
  product.update
  redirect to "products"
end 

post '/products/:id/delete' do
  Product.delete(params[:id])
  redirect :"products"
end

