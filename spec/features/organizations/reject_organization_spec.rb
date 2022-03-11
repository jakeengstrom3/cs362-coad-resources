require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do

    let(:admin) {create(:user, :make_admin)}
    let(:organization_rejected) {create(:organization, :set_submitted)}

    scenario "admin rejects an organization" do
        admin.confirm
        log_in_as(admin)
        visit organization_path(organization_rejected)
        click_on "Reject"
        expect(page).to have_text('has been rejected')
    end
end
