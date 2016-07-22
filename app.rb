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
  brand_name = params.fetch("brand_name")
  Brand.create({:name => brand_name})
  redirect back
end

post("/stores") do
  store_name = params.fetch("store_name")
  brand_ids = params.fetch("brand_ids")
  @store = Store.create({:name => name, :brand_ids => brand_ids})
  redirect("/stores".concat(@store.id().to_s()))
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @stores.Store.all()

  erb(:store)
end

patch("/stores/:id") do
  params.fetch("form_id").==("change_name")
  @store = Store.find(params.fetch("id").to_i())
  store_name = params.fetch("store_name")
  @store.update({:name => store_name})
  redirect back
end

get("/stores") do
  @stores = Store.all()
  erb(:stores)
end
