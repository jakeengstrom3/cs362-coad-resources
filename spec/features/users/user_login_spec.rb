require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  scenario "returning user logs in" do
    user = create(:user)
    user.confirm
    visit 'login'

    fill_in "Email address", with: user.email
    fill_in "Password", with: user.password

    click_on "Sign in"
    expect(page).to have_text "Signed in successfully."
  end
  scenario "new user tries to log in" do
    visit 'login'

    fill_in "Email address", with: "newEmail@fake.com"
    fill_in "Password", with: "FAKE"

    click_on "Sign in"
    expect(page).to have_text "Invalid Email or password."
  end
  scenario "returning user attempts to log in with wrong password" do
    user = create(:user)
    user.confirm
    visit 'login'

    fill_in "Email address", with: user.email
    fill_in "Password", with: "Incorrect_Password"
    click_on "Sign in"
    expect(page).to have_text "Invalid Email or password."
  end
end
