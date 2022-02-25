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
end
