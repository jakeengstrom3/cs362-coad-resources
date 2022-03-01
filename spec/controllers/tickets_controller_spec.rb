require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

    describe "A user who is not logged in" do
        it "Redirects to sign-in screen" do
            expect { get:show, params,: {id:"FAKE"}}.to raise_error
            get :new
            expect(response).to redirect_to (dashboard_path)
        end
    end
end
