require 'rails_helper'

RSpec.describe User, type: :model do
  
  let (:user) {User.new(email: "FAKE_EMAIL@FAKE.FAKE",
                        password: "FAKE_PASSWORD")}

  it "exits" do
    user
  end

  describe "attributes" do
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
  end


end
