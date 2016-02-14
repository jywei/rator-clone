require 'rails_helper'

RSpec.describe "Companies", type: :request do
  describe "GET /companies" do
    it "should companies list" do
      get "/api/v1/companies"
      expect(response).to have_http_status(200)
    end
  end
end