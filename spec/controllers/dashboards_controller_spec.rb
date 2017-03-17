require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #debts" do
    it "returns http success" do
      get :debts
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #not_received_feedback" do
    it "returns http success" do
      get :not_received_feedback
      expect(response).to have_http_status(:success)
    end
  end

end
