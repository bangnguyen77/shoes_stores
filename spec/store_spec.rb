require("spec_helper")

describe(Store) do
  it { should have_and_belong_to_many(:brands) }

  it("validates the presence of a store name") do
    test_store = Store.new({:name => ""})
    expect(test_store.save()).to(eq(false))
  end

  it("capitalizes the store name") do
    test_store = Store.create({:name => 'nike'})
    expect(test_store.name()).to(eq('Nike'))
  end
end
