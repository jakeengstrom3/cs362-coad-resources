require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let (:resource_category) {build(:resource_category)}

  it "exits" do
    ResourceCategory.new
  end


  describe "attributes" do
    it "validates presence of name" do
      expect(resource_category).to validate_presence_of(:name)
    end

    it "validates name length" do
      expect(resource_category).to validate_length_of(:name).is_at_least(1).is_at_most(255)
    end
    
    it "validates name uniqueness" do
      expect(resource_category).to validate_uniqueness_of(:name).case_insensitive
    end

    it "has many tickets" do
      expect(resource_category).to have_many(:tickets)
    end

    it "has and belogs to many organizations" do
      expect(resource_category).to have_and_belong_to_many(:organizations)
    end

  end

  describe "to_s" do
    it "returns name as a string" do
      expect(resource_category.to_s).to eq("FAKE NAME")
    end 
  end

  describe "activate" do
    it "sets active value to true" do
      resource_category.activate
      expect(resource_category.active).to eq(true)
    end
  end

  describe "deactivate" do
    it "sets active value to false" do
      resource_category.deactivate
      expect(resource_category.active).to eq(false)
    end
  end

  describe "inacive?" do
    it "returns true if active is false, and false if active is true" do
      resource_category.activate
      expect(resource_category.inactive?).to eq(false)
      resource_category.deactivate
      expect(resource_category.inactive?).to eq(true)
    end
  end
end
