require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

    describe "A user who is not logged in" do
        it "Redirects to sign-in screen" do
            get :index
            expect(response).to redirect_to(new_user_session_path)
            get :new
            expect(response).to redirect_to(new_user_session_path)
        end
    end
end
