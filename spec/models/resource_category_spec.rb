require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let (:resource_category) {ResourceCategory.new}

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


end
