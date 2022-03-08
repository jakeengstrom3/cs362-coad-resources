require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do

    scenario "with valid atributes succeeds" do
        user = create(:user, :admin)
        user.confirm
        log_in_as(user)
        visit new_region_url
        fill_in "Name", with: "FAKE Region"
        click_on "Add Region"
        expect(page).to have_text "Region successfully created"
        expect(page).to have_text "FAKE Region"
    end

    scenario "with invalid atributes shows error" do
        user = create(:user, :admin)
        user.confirm

        log_in_as(user)
        visit new_region_url
        fill_in "Name", with: ""
        click_on "Add Region"
        expect(page).to have_text "errors prohibited this region"
    end


end
