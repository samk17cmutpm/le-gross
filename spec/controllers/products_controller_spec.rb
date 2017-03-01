require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET /products" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /products/" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
