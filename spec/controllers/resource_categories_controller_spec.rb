require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

  describe "A user who is not signed in" do
    it "redirects to sign in screen" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
      get :new
      expect(response).to redirect_to(new_user_session_path)
      get :edit, params:{id: "FAKE ID"}
      expect(response).to redirect_to(new_user_session_path)
      get :show, params:{id: "FAKE ID"}
      expect(response).to redirect_to(new_user_session_path)
      patch :activate, params:{id: "FAKE ID"}
      expect(response).to redirect_to(new_user_session_path )
      patch :deactivate, params:{id: "FAKE ID"}
      expect(response).to redirect_to(new_user_session_path)
      patch :update, params:{id: "FAKE ID"}
      expect(response).to redirect_to(new_user_session_path)
      post :create, params:{id: "FAKE ID"}
      expect(response).to redirect_to(new_user_session_path)
      put :update, params:{id: "FAKE ID"}
      expect(response).to redirect_to(new_user_session_path)
      delete :destroy, params:{id: "FAKE ID"}
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "A user who is signed in as an organiztion" do
    it "redirects to the dashboard" do
      org_user = create(:user, :make_org)
      org_user.confirm
      sign_in(org_user)
      get :index
      expect(response).to redirect_to(dashboard_path)
      get :new
      expect(response).to redirect_to(dashboard_path)
      get :edit, params:{id: "FAKE ID"}
      expect(response).to redirect_to(dashboard_path)
      get :show, params:{id: "FAKE ID"}
      expect(response).to redirect_to(dashboard_path)
      patch :activate, params:{id: "FAKE ID"}
      expect(response).to redirect_to(dashboard_path )
      patch :deactivate, params:{id: "FAKE ID"}
      expect(response).to redirect_to(dashboard_path)
      patch :update, params:{id: "FAKE ID"}
      expect(response).to redirect_to(dashboard_path)
      post :create, params:{id: "FAKE ID"}
      expect(response).to redirect_to(dashboard_path)
      put :update, params:{id: "FAKE ID"}
      expect(response).to redirect_to(dashboard_path)
      delete :destroy, params:{id: "FAKE ID"}
      expect(response).to redirect_to(dashboard_path)
    end
  end

end
