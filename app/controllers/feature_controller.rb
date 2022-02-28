class FeatureController < ApplicationController
  before_action :set_feature, only: %i[destroy]

  def create
    @product = Product.find(params[:product_id])
    @feature = @product.features.create(feature_params)
    if @feature.save
      redirect_to category_product_path(@product), notice: "Comment was successfully created."
    else
      redirect_to category_product_path(@product), alert: "Comment was not created"
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @feature = @product.features.find(params[:id])
    @feature.destroy
    redirect_to category_product_path(@product)
  end

  private

  def feature_params
    params.require(:feature).permit(:name)
  end

  def set_feature
    @feature = Feature.find(params[:category_id, :product_id, :id])
  end
end
