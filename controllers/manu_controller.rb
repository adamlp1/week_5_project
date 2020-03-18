require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/manufacturer')
also_reload('../models/*')

get '/manufacturers' do
  @manufacturers = Manufacturer.all
  erb(:"manufacturers/index")
end

get '/manufacturers/new' do 
  @manufacturers = Manufacturer.all 
  erb(:"manufacturers/new")
end

get '/manufacturers/:id/edit' do 
  @manufacturer = Manufacturer.find(params['id'])
  erb(:"manufacturers/edit")
end

post '/manufacturers/:id' do 
  manufacturer = Manufacturer.new(params)
  manufacturer.update
  redirect to "manufacturers"
end 

post '/manufacturers' do 
  manufacturer = Manufacturer.new(params)
  manufacturer.save
  redirect to ("/manufacturers")
end

post '/manufacturers/:id/delete' do
  Manufacturer.delete(params[:id])
  redirect :"manufacturers"
end

