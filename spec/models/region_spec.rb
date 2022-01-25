require 'rails_helper'

RSpec.describe Region, type: :model do

  let(:region) {Region.new}

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
    
   
  end

end
