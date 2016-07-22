require("spec_helper")

describe(Brand) do
  it { should have_and_belong_to_many(:stores) }

  it("validates the presence of a shoe name") do
    test_brand = Brand.new({:name => ""})
    expect(test_brand.save()).to(eq(false))
  end


  it("capitalizes the brand name") do
    test_brand = Brand.create({:name => 'nike'})
    expect(test_brand.name()).to(eq('Nike'))
  end

end
