require('sinatra')
require('sinatra/contrib/all')
require_relative('models/product')
require_relative('models/manufacturer')
also_reload('./models/*')

get '/inventory' do
  @products = Product.all
  erb(:index)
end
