require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

    describe "A user who is not logged in" do
        it "Redirects to sign-in screen" do
            get :index
            expect(response).to redirect_to(new_user_session_path)
        end
    end
    describe "A signed in user" do
        it "redirects to dashboard" do
            org_user = create(:user, :make_org)
            org_user.confirm
            sign_in(org_user)

            get :index
            expect(response).to be_successful
        end
    end
end
