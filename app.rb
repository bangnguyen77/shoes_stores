require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

get("/stores/new") do
  @brands = Brand.all()
  erb(:store_form)
end

post("/brands") do
  name = params.fetch("name")
  Brand.create({:name => name})
  redirect back
end

post("/stores") do
  name = params.fetch("name")
  brand_ids = params.fetch("brand_ids")
  @brands = []
  brand_ids_integers = []
  brand_ids.each() do |brand_id|
    brand = Brand.find(brand_id.to_i())
    @brands.push(brand)
    brand_ids_integers.push(brand_id.to_i())
  end
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  erb(:store)
end

get("/stores") do
  @stores = Store.all()
  erb(:stores)
end
