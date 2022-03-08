require 'rails_helper'

RSpec.describe 'User registration', type: :feature do
  scenario "new user signs up" do
    visit 'signup'

    fill_in "Email address", with: "new_user@new.com"
    fill_in "Password", with: "FAKE_PASSWORD"
    
    # click_on "Sign up"
    # expect(page).to have_text ""
  end
end
