require 'rails_helper'

RSpec.describe Organization, type: :model do

	let(:organization) {Organization.new(email: "FakeEmail@FakeEmail.com", 
		name: "FAKE NAME",
			phone: "1111111111",
			status: 1,
			primary_name: "FAKE PRIMARY",
			secondary_name: "FAKE SECONDARY",
			secondary_phone: "1111111111",
			description: "This is a very real description")}

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
  end
end
