require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

  describe "A user who is not signed in as Admin" do
    it "redirects to sign in screen" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
      get :new
      expect(response).to redirect_to(new_user_session_path)
      get :edit, params:{id: "FAKE ID"}
      expect(response).to redirect_to(new_user_session_path)
      
    end
  end

end
