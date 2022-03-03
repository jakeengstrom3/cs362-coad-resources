require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

  before do
    #Create region and category so they will show up in the selector
    create(:region)
    create(:resource_category)
    visit new_ticket_path
  end
  
  describe "creating a ticket" do
    scenario "non-logged in user creates a ticket" do
      
      fill_in "Full Name", with: "FAKE NAME"
      fill_in "Phone Number", with: "5555555555"
      select "Region #", from: "Region"
      select "Resource_Category #", from: "Resource Category"
      fill_in "Description", with: "Fake Description"

      click_on "Send this help request"
      expect(page).to have_text "Ticket Submitted"
    end

  end

end
