require("spec_helper")

describe(Store) do
  it("has many brands") do
    test_store = Store.create({:name => "Portland"})
    test_brand1 = test_store.brands.new({:name => "Nike"})
    test_brand2 = test_store.brands.new({:name => "Columbia"})
    expect(test_store.brands()).to(eq([test_brand1, test_brand2]))
  end
end
