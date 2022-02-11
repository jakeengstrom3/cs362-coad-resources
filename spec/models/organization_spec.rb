require 'rails_helper'

RSpec.describe Organization, type: :model do

	let(:organization) {build(:organization)} 

	it "exsists" do
	  organization
	end

	describe "attributes" do
    it "validates presence of email" do
      expect(organization).to validate_presence_of(:email)
    end

    it "validates presence of name" do
      expect(organization).to validate_presence_of(:name)
    end

    it "validates presence of phone" do
      expect(organization).to validate_presence_of(:phone)
    end

    it "validates presence of status" do
      expect(organization).to validate_presence_of(:status)
    end

    it "validates presence of primary_name" do
      expect(organization).to validate_presence_of(:primary_name)
    end

    it "validates presence of secondary_name" do
      expect(organization).to validate_presence_of(:secondary_name)
    end

    it "validates presence of secondary_phone" do
      expect(organization).to validate_presence_of(:secondary_phone)
    end

    it "validates email length" do
      expect(organization).to validate_length_of(:email).is_at_least(1).is_at_most(255)
    end

    it "validates name length" do
      expect(organization).to validate_length_of(:name).is_at_least(1).is_at_most(255)
    end

    it "validates description length" do
      expect(organization).to validate_length_of(:description).is_at_most(1020)
    end
    
    it "validates email uniqueness" do
      expect(organization).to validate_uniqueness_of(:email).case_insensitive
    end

    it "validates name uniqueness" do
      expect(organization).to validate_uniqueness_of(:name).case_insensitive
    end

    it "checks if it has many users" do
      expect(organization).to have_many(:users)
    end

    it "checks if it has many tickets" do
      expect(organization).to have_many(:tickets)
    end

    it "checks if it has many resource_categories" do
      expect(organization).to have_and_belong_to_many(:resource_categories)
    end
  end

  describe "to_s" do
    it "returns name as a string" do
      organization = build(:organization, name: "FAKE NAME")
      expect(organization.to_s).to eq("FAKE NAME")
    end
  end

  describe "status changes" do

		it "checks if status was set to 'submitted' by default" do
			expect(organization.status).to eq("submitted")
		end 

		it "sets status to rejected" do
      organization.status = "approved"
			expect(organization.status).to_not eq("rejected")
			organization.reject
			expect(organization.status).to eq("rejected")
		end

		it "sets status to approved" do
      organization.status = "rejected"
			expect(organization.status).to_not eq("approved")
			organization.approve
			expect(organization.status).to eq("approved")
		end
  end
end
