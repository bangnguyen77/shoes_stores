require("spec_helper")

describe(Brand) do
  it { should have_and_belong_to_many(:stores) }

  it { should validate_presence_of(:name) }

  it { should validate_length_of(:name) }

  it("capitalizes the brand name") do
    brand = Brand.create({:name => 'nike'})
    expect(brand.name()).to(eq('Nike'))
  end
end
