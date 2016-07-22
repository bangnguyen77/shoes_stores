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
  # @stores.Store.all()
  # @brands = Brand.all()
  @brands = Brand.all() - @store.brands()
  erb(:store)
end

patch("/stores/:id") do
  if params.fetch("form_id").==("change_name")
    @store = Store.find(params.fetch("id").to_i())
    store_name = params.fetch("store_name")
    @store.update({:name => store_name})
  elsif params.fetch("form_id").==("add_brands")
    new_brand_ids = params[:brand_ids]
    @store = Store.find(params.fetch("id").to_i())
    brand_ids_array = []
    @store.brands().each() do |brand|
      brand_ids_array.push(brand.id())
    end
    new_brand_ids.each() do |id|
      brand_ids_array.push(id)
    end
    @store.update({:brand_ids => brand_ids_array})
  else
    @store = Store.find(params.fetch("id").to_i())
    remove_brand_ids = params[:brand_ids]
    remove_brand_ids.each() do |i|
      @store.brands.destroy(Brand.find(id))
    end
  end
  redirect back
end

get("/stores") do
  @stores = Store.all()
  erb(:stores)
end

delete("/stores/:id") do
  store = Store.find(params.fetch("id"))
  store.destroy()
  redirect ("/stores")
end

get("/stores") do
  @stores = Store.order()
  erb(:stores)
end
