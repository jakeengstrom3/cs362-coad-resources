require 'rails_helper'

RSpec.describe Region, type: :model do

    let(:region) {Region.new}
    
    it "exists" do
      Region.new
    end

    describe "attributes" do
      it "has a name" do
        expect(region).to respond_to(:name)
      end
    end

end
