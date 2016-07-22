require("spec_helper")

describe(Brand) do
  it { should have_and_belong_to_many(:stores) }
end

describe(Brand) do
  describe("#validation") do
    it("validates the presence of a shoe name") do
      test_brand = Brand.new({:name => ""})
      expect(test_brand.save()).to(eq(false))
    end
  end

  describe("#capitalize") do
    it("capitalizes the brand name") do
      test_brand = Brand.create({:name => 'nike'})
      expect(test_brand.name().capitalize()).to(eq('Nike'))
    end
  end
end
