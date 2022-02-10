require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:region) {build(:region)}

  it "exists" do
    region
  end

  describe "attributes" do
    it "validates presence of name" do
      expect(region).to validate_presence_of(:name)
    end

    it "validates name length" do
      expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255)
    end
    
    it "validates name uniqueness" do
      expect(region).to validate_uniqueness_of(:name).case_insensitive
    end

    it "checks if it has many tickets" do
      expect(region).to have_many(:tickets)
    end
  end

  describe "to_s" do
    it "returns name as a string" do
      region = build(:region, name: "FAKE REGION")
      expect(region.to_s).to eq("FAKE REGION")
    end
  end

end
