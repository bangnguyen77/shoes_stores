require("spec_helper")

describe(Store) do
  it("has many brands") do
    test_store = Store.create({:name => "Portland"})
    test_brand1 = test_store.brands.new({:name => "Nike"})
    test_brand2 = test_store.brands.new({:name => "Columbia"})
    expect(test_store.brands()).to(eq([test_brand1, test_brand2]))
  end

  it("ensures the name is present") do
    store = Store.new({:name => ''})
    expect(store.save()).to(eq(false))
  end

  it("ensures the name is less than 50 characters") do
    store = Store.new({:name => "a".*(51)})
    expect(store.save()).to(eq(false))
  end

  it("capitalizes the store name") do
    store = Store.create({:name => 'epicodus'})
    expect(store.name()).to(eq('Epicodus'))
  end
end
