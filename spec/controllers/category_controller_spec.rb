# frozen_string_literal: true

require "rails_helper"

RSpec.describe CategoryController, type: :controller do
  describe "GET #index" do
    let(:categories) { [create(:category)] }

    it "returns all pages" do
      get :index

      expect(response).to render_template("index")
      expect(response).to have_http_status(:ok)
      expect(assigns(:categories)).to eq(categories)
    end
  end

  describe "GET #show" do
    let(:category) { create(:category) }

    it "returns category" do
      get :show, params: { id: category.id }

      expect(response).to render_template("show")
      expect(response).to have_http_status(:ok)
      expect(assigns(:category)).to eq(category)
    end
  end

  describe "GET #new" do
    it "returns render form for creating new category" do
      get :new

      expect(response).to render_template("new")
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:category_params) { attributes_for(:category) }

    it "creates new category" do
      post :create, params: { category: category_params }

      expect(response).to redirect_to(root_url)
      expect(response).to have_http_status(:found)
    end

    it "does not create new category" do
      post :create, params: { category: { title: "a" } }

      expect(response).to render_template("new")
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "GET #edit" do
    let(:category) { create(:category) }

    it "returns render form for editing category" do
      get :edit, params: { id: category.id }

      expect(response).to render_template("edit")
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    let(:category) { create(:category) }

    it "updates category" do
      put :update, params: { id: category.id, category: { title: "New title" } }

      expect(response).to redirect_to(root_url)
      expect(response).to have_http_status(:found)
    end

    it "does not update category" do
      put :update, params: { id: category.id, category: { title: nil } }

      expect(response).to render_template("edit")
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE #destroy" do
    let(:category) { create(:category) }

    it "destroys category" do
      delete :destroy, params: { id: category.id }

      expect(response).to redirect_to(root_url)
      expect(response).to have_http_status(:found)
    end
  end
end
