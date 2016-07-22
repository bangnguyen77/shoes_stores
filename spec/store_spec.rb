require("spec_helper")

describe(Store) do
  it { should have_and_belong_to_many(:brands) }
end

describe(Store) do
  describe("#validation") do
    it("validates the presence of a store name") do
      test_store = Store.new({:name => ""})
      expect(test_store.save()).to(eq(false))
    end
  end

  describe("#capitalize") do
    it("capitalizes the store name") do
      test_store = Store.create({:name => 'nike'})
      expect(test_store.name().capitalize()).to(eq('Nike'))
    end
  end
end
