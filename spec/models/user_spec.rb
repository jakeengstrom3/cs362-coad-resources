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
  end


end
