require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

    describe "A user who is not logged in" do
        it "Redirects to dashboard" do
            get :show, params: {id: 'FAKE'}
            expect(response).to redirect_to(dashboard_path)
            post :capture, params: {id: 'FAKE'}
            expect(response).to redirect_to(dashboard_path)
            post :release, params: {id: 'FAKE'}
            expect(response).to redirect_to(dashboard_path)
            patch :close, params: {id: 'FAKE'}
            expect(response).to redirect_to(dashboard_path)
            delete :destroy, params:{id:"FAKE"}
            expect(response).to redirect_to(dashboard_path)
        end
    end

    describe "An approved organization user" do
        it "Redirects to dashboard" do
            orginization_user = create(:user, :make_org)
            orginization_user.confirm
            orginization_user.organization.approve
            sign_in(orginization_user)

            delete :destroy, params:{id:"FAKE"}
            expect(response).to redirect_to(dashboard_path)
        end
    end

    describe "An un-approved organization user" do
        it "rediects to dashboard" do
            orginization_user = create(:user, :make_org)
            orginization_user.confirm
            orginization_user.organization.reject
            orginization_user.organization.save!
            sign_in(orginization_user)
            
            get :show, params: {id: 'FAKE'}
            expect(response).to redirect_to(dashboard_path)
            post :capture, params: {id: 'FAKE'}
            expect(response).to redirect_to(dashboard_path)
            post :release, params: {id: 'FAKE'}
            expect(response).to redirect_to(dashboard_path)
            patch :close, params: {id: 'FAKE'}
            expect(response).to redirect_to(dashboard_path)
            delete :destroy, params:{id:"FAKE"}
            expect(response).to redirect_to(dashboard_path)
        end
    end
end
