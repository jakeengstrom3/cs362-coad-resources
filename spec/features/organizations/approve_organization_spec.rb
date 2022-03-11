require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do

    let(:admin) {create(:user, :make_admin)}
    let(:organization_submitted) {create(:organization, :set_submitted)}

    scenario "admin approves an organization" do
        admin.confirm
        log_in_as(admin)
        visit organization_path(organization_submitted)
        click_on "Approve"
        expect(page).to have_text('has been approved')
    end
end
