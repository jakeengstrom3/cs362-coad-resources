require 'rails_helper'

RSpec.describe User, type: :model do

  FAKE_EMAIL = "FAKE_EMAIL@FAKE.FAKE"
  FAKE_PASSWORD = "FAKE_PASSWORD"
  let (:user) {User.new(email: FAKE_EMAIL,
                        password: FAKE_PASSWORD)}



  it "exits" do
    user
  end

  describe "attributes" do
    it "defines role enum" do
      expect(user).to define_enum_for(:role)
    end

    it "belongs_to organization" do
      expect(user).to belong_to(:organization)
    end

    it "validates presence of email" do
      expect(user).to validate_presence_of(:email)
    end
    
    it "validates length of email" do
      expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255)
    end

    it "validates format of email" do
      expect(user).to allow_value("valid@valid.valid").for(:email)
      expect(user).to_not allow_value("Invalid4invalid").for(:email)
    end
    
    it "validates uniqueness of email" do
      expect(user).to validate_uniqueness_of(:email).case_insensitive
    end

    it "validates presence of password" do
      expect(user).to validate_presence_of(:password)
    end

    it "validates length of password" do
      expect(user).to validate_length_of(:password).is_at_least(7).is_at_most(255)
    end
    
    it "sets default role to organization if its a new record" do
      expect(user.role).to eq("organization")
    end
  end

  describe "to_s" do
    it "returns the string email" do
      expect(user.to_s).to eq(FAKE_EMAIL)
    end
  end

  describe "set_default_role" do
    it "sets the role to organization" do
      user.set_default_role
      expect(user.role).to eq("organization")
    end
  end

end
