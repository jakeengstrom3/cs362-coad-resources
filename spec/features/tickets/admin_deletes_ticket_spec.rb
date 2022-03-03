require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  before do
    # Create Ticket to delete, log in as admin, then go to dashboard
    create(:ticket, name: "TICKET_TO_DELETE")
    user = create(:user, :admin)
    user.confirm
    log_in_as(user)
    visit '/dashboard'
  end

  scenario "as an admin succeeds" do
    click_on "TICKET_TO_DELETE"
    click_on "Delete"
    expect(page).to_not have_text("TICKET_TO_DELETE")
  end

end
