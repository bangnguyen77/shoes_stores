require("spec_helper")

describe(Brand) do
  it("belongs to a store")
  test_store = Store.create({:name => "Portland"})
  test_brand1 = test_store.brands.new({:name => "Nike"})
  expect(test_store.brands()).to(eq([test_brand1]))
end
