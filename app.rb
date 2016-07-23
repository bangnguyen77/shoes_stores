require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/stores') do
  @stores = Store.all.order('name')
  erb(:stores)
end

post("/stores") do
  name = params["store_name"]
  Store.create({:name => name})
  redirect back
end

patch('/stores') do
  store_id = params['store_id']
  store = Store.find(store_id)
  new_name = params['new_name']
  store.update({:name => new_name})
  redirect back
end

delete('/stores') do
  store_id = params['store_id']
  store = Store.find(store_id)
  store.brands.destroy # redundant
  store.destroy
  redirect back
end


get('/brands') do
  @brands = Brand.all().order('name')
  erb(:brands)
end

post("/brands") do
  name = params["brand_name"]
  Brand.create({:name => name})
  redirect back
end


patch('/brands') do
  brand_id = params['brand_id']
  brand = Brand.find(brand_id)
  new_name = params['new_name']
  brand.update({:name => new_name})
  redirect back
end

delete('/brands') do
  brand_id = params['brand_id']
  brand = Brand.find(brand_id)

  brand.destroy
  redirect back
end
