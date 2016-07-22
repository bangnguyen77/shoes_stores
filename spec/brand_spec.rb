require("spec_helper")

describe(Brand) do
  it("belongs to a store")j do
    test_store = Store.create({:name => "Portland"})
    test_brand1 = test_store.brands.new({:name => "Nike"})
    expect(test_store.brands()).to(eq([test_brand1]))
  end

  it("ensures the name is present") do
    brand = Brand.new({:name => ''})
    expect(brand.save()).to(eq(false))
  end
  it("ensures the name is less than 50 characters") do
    brand = Brand.new({:name => "a".*(51)})
    expect(brand.save()).to(eq(false))
  end

  it("capitalizes the brand name") do
    brand = Brand.create({:name => 'nike'})
    expect(brand.name()).to(eq('Nike'))
  end
end
