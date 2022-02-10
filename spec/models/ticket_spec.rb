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
  end


  describe "validations" do
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

  describe "methods" do

    describe "open?" do
      it "returns true if not closed, else returns false" do
        ticket = build(:ticket, closed: true)
        expect(ticket.open?).to eq(false)
        ticket = build(:ticket, closed: false)
        expect(ticket.open?).to eq(true)
      end
    end

    describe "to_s" do
      it "returns the string 'Ticket' followed by the ticket id" do
        ticket = build(:ticket, id: 11111)
        expect(ticket.to_s).to eq("Ticket 11111")
      end
    end

  end

  describe "scope" do
    describe "open" do
      it "retreives all open tickets, and only open tickets" do
        # When I retreive open tickets
        # I should receive only open tickets
        open_ticket = create(:ticket, closed: false)
        closed_ticket = create(:ticket, closed: true)
        results = Ticket.open

        expect(results).to include(open_ticket)
        expect(results).to_not include(closed_ticket)
      end
      
    end
  end

end 
