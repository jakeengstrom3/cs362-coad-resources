require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket) {FactoryBot.build(:ticket)} 

  describe "attributes" do
    it "belongs to a region" do
      expect(ticket).to belong_to(:region);
    end
    
    it "belongs to resource category" do
      expect(ticket).to belong_to(:resource_category)
    end
    
    it "belongs to an organization" do
      expect(ticket).to belong_to(:organization)
    end

    it "validates presence of name, phone, region id, and resource_category" do
      expect(ticket).to validate_presence_of(:name)
      expect(ticket).to validate_presence_of(:phone)
      expect(ticket).to validate_presence_of(:region_id)
      expect(ticket).to validate_presence_of(:resource_category_id)
    end

    it "validates length of name" do
      expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255)
    end

    it "validates length of description" do
      expect(ticket).to validate_length_of(:description).is_at_most(1020)
    end
  end

end 
