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
      it "retreives all open tickets that do not have an organization" do
        # When I retreive open tickets
        # I should receive only open tickets
        open_ticket = create(:ticket, closed: false, organization: nil)
        closed_ticket = create(:ticket, closed: true, organization: nil)
        results = Ticket.open

        expect(results).to include(open_ticket)
        expect(results).to_not include(closed_ticket)
      end
      
    end

    describe "closed" do
      it "retreived all closed tickets, and only closed tickets" do
        open_ticket = create(:ticket, closed: false)
        closed_ticket = create(:ticket, closed: true)
        results = Ticket.closed

        expect(results).to_not include(open_ticket)
        expect(results).to include(closed_ticket)
      end
    end

    describe "all_organization" do
      it "retreives all open tickets with an organization" do
        open_ticket_with_org = create(:ticket, closed: false)
        results = Ticket.all_organization

        expect(results).to include(open_ticket_with_org)

      end
    end

    describe "organization" do
      it "retreives all open tickets of a specific organization id" do
        ticket = create(:ticket)
        organization_id = ticket.organization_id
        expect(Ticket.organization(organization_id)).to include(ticket)
      end
    end

    describe "closed_organizaion" do
      it "retreives all open tickets with the specified organization id" do
        closed_ticket_with_same_org = create(:ticket, closed: true)
        open_ticket_with_same_org = create(:ticket, organization: closed_ticket_with_same_org.organization)
        closed_ticket_with_diff_org = create(:ticket, closed: true)

        organization_id = closed_ticket_with_same_org.organization_id

        expect(Ticket.closed_organization(organization_id)).to include(closed_ticket_with_same_org)
        expect(Ticket.closed_organization(organization_id)).to_not include(closed_ticket_with_diff_org)
        expect(Ticket.closed_organization(organization_id)).to_not include(open_ticket_with_same_org)
      end
    end

    describe "region" do
      it "retreives all tickets with the specified region_id" do
        ticket_with_same_region_1 = create(:ticket)
        common_region = ticket_with_same_region_1.region
        ticket_with_same_region_2 = create(:ticket, region: common_region)
        ticket_with_different_region = create(:ticket)

        results = Ticket.region(common_region)

        expect(results).to include(ticket_with_same_region_1, ticket_with_same_region_2)
        expect(results).to_not include(ticket_with_different_region)
      end
    end

    describe "resource category" do
      it "retreives all tickets with the specified resource category" do 
        ticket_with_same_resource_category_1 = create(:ticket)
        common_resource_category = ticket_with_same_resource_category_1.resource_category
        ticket_with_same_resource_category_2 = create(:ticket, resource_category: common_resource_category)
        ticket_with_different_resource_category = create(:ticket)

        results = Ticket.resource_category(common_resource_category)

        expect(results).to include(ticket_with_same_resource_category_1, ticket_with_same_resource_category_2)
        expect(results).to_not include(ticket_with_different_resource_category)

      end
    end
  end

end 
