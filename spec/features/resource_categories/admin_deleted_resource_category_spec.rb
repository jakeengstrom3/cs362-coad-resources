require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
  before do
    create(:resource_category, name: "CATEGORY_TO_DELETE")
    user = create(:user, :admin)
    user.confirm
    log_in_as(user)
    visit '/resource_categories'
  end

  scenario "admin sucefully deletes resource category" do
    click_on "CATEGORY_TO_DELETE"
    click_on "Delete"

    expect(page).to have_text("Category CATEGORY_TO_DELETE was deleted")
  end
end
