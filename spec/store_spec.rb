require("spec_helper")

describe(Store) do
  it {should have_and_belong_to_many(:brands)}

  it {should validate_presence_of(:name)}

  it {should validate_length_of(:name)}

  it("capitalizes the store name") do
    store = Store.create({:name => 'epicodus'})
    expect(store.name()).to(eq('Epicodus'))
  end
end
