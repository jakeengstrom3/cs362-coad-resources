require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:region) {Region.new(name: "FAKE NAME")}

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
  end

  describe "to_s" do
    it "returns name as a string" do
      expect(region.to_s).to eq("FAKE NAME")
    end
  end

end
