require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

    describe "A user who is not logged in" do
        it "Redirects to dashboard" do
            get :show, params: {id: 'FAKE'}
            expect(response).to redirect_to(dashboard_path)
            delete :destroy, params:{id:"FAKE"}
            expect(response).to redirect_to(dashboard_path)
        end
    end

    describe "An organization user" do
        it "Redirects to dashboard" do
            orginization_user = create(:user, :make_org)
            orginization_user.confirm
            sign_in(orginization_user)
            delete :destroy, params:{id:"FAKE"}
            expect(response).to redirect_to(dashboard_path)
        end
    end
end
