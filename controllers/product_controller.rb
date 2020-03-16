require('sinatra')
require('sinatra/contrib/all')
require_relative('models/product')
also_reload('./models/*')

get '/products' do
  @products = Product.all
  erb(:index)
end
