# frozen_string_literal: true

class FeaturesController < ApplicationController
  before_action :set_feature, only: %i[show edit update]

  def show; end

  def new
    @feature = Feature.new
  end

  def edit; end

  def create
    product = Product.find(params[:product_id])
    @feature = Feature.new(feature_params.merge(product: product))
    if @feature.save
      redirect_to category_product_path(@product), notice: "Comment was successfully created."
    else
      redirect_to category_product_path(@product), alert: "Comment was not created"
    end
  end

  def update
    if @feature.update(feature_params)
      redirect_to :root, notice: "Feature was successfully updated."
    else
      render  edit_category_product_path(@feature.product.category, @feature.product), status: :unprocessable_entity
    end
  end

  def destroy
    @feature = Feature.find(params[:id])
    @feature.destroy
  end

  private

    def feature_params
      params.require(:feature).permit(:name, :value, :product_id)
    end

    def set_feature
      @feature = Feature.find(params[:category_id, :product_id, :id])
    end
end
