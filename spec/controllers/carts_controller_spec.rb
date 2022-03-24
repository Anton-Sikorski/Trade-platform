# frozen_string_literal: true

require "rails_helper"
require_relative "../support/devise"

RSpec.describe CartsController, type: :controller do
  describe "GET /show" do
    let(:user) { create(:user) }

    it "returns http success" do
      sign_in user
      get :show

      expect(response).to have_http_status(:success)
    end
  end
end
