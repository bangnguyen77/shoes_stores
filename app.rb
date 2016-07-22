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
  brands = params.fetch("brand_ids")
  @brands = []
  brand_ids.each() do |brand_id|
    @brands.push(brand)
  end
end
