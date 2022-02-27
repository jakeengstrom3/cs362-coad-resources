require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

    describe "A user who is not logged in" do
        it "Redirects to sign-in screen" do
            get :index
            expect(response).to redirect_to(new_user_session_path)
            get :new
            expect(response).to redirect_to(new_user_session_path)
            get :edit, params:{id:"FAKE"}
            expect(response).to redirect_to(new_user_session_path)
            get :show, params:{id:"FAKE"}
            expect(response).to redirect_to(new_user_session_path)
            post :create
            expect(response).to redirect_to(new_user_session_path)
            delete :destroy, params:{id:"FAKE"}
            expect(response).to redirect_to(new_user_session_path)
            patch :update, params:{id:"FAKE"} 
            expect(response).to redirect_to(new_user_session_path)
            put :update, params:{id:"FAKE"}
            expect(response).to redirect_to(new_user_session_path)
        end
    end

     describe "A user who is logged in" do
         it "Redirects to proper page" do
            orginization_user = create(:user, :make_org)
            orginization_user.confirm
            sign_in(orginization_user)

             get :index
             expect(response).to redirect_to(dashboard_path)
             get :new
             expect(response).to redirect_to(dashboard_path)
             get :edit, params:{id:"FAKE"}
             expect(response).to redirect_to(dashboard_path)
             get :show, params:{id:"FAKE"}
             expect(response).to redirect_to(dashboard_path)
             post :create
             expect(response).to redirect_to(dashboard_path)
             delete :destroy, params:{id:"FAKE"}
             expect(response).to redirect_to(dashboard_path)
             patch :update, params:{id:"FAKE"} 
             expect(response).to redirect_to(dashboard_path)
             put :update, params:{id:"FAKE"}
             expect(response).to redirect_to(dashboard_path)
         end
     end
end
