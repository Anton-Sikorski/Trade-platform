# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  describe "GET #show" do
    let(:product) { create(:product) }

    it "returns products" do
      get :show, params: { category_id: product.category_id, id: product.id }

      expect(response).to render_template("show")
      expect(response).to have_http_status(:ok)
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "GET #new" do
    let(:category) { create(:category) }

    it "returns render form for creating new products" do
      get :new, params: { category_id: category.id }

      expect(response).to render_template("new")
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:category) { create(:category) }
    let(:store) { create(:store) }
    let(:product_params) { attributes_for(:product, store_id: store.id) }

    it "creates new products" do
      post :create, params: { category_id: category.id, product: product_params }

      expect(response).to redirect_to(category_path(category))
      expect(response).to have_http_status(:found)
    end

    it "does not create new products" do
      post :create, params: { category_id: category.id, product: product_params.except(:title) }

      expect(response).to render_template("new")
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "GET #edit" do
    let(:product) { create(:product) }

    it "returns render form for editing products" do
      get :edit, params: { category_id: product.category_id, id: product.id }

      expect(response).to render_template("edit")
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    let(:product) { create(:product) }

    it "updates products" do
      put :update, params: { category_id: product.category_id, id: product.id, product: { title: "New name" } }

      expect(response).to redirect_to(category_product_path(product.category, product))
      expect(response).to have_http_status(:found)
    end

    it "does not update products" do
      put :update, params: { category_id: product.category_id, id: product.id, product: { title: nil } }

      expect(response).to render_template("edit")
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE #destroy" do
    let(:product) { create(:product) }

    it "destroys products" do
      delete :destroy, params: { category_id: product.category_id, id: product.id }

      expect(response).to redirect_to(root_url)
      expect(response).to have_http_status(:found)
    end
  end
end
