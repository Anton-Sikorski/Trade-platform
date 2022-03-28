# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def show; end

  def new
    @product = Product.new(category_id: params[:category_id])
  end

  def edit; end

  def create
    category = Category.find(params[:category_id])
    @product = Product.new(product_params.merge(category: category))

    if @product.save
      redirect_to category_path(category), notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    category = Category.find(params[:category_id])
    if @product.update(product_params.reject { |k| k["images"] }.merge(category: category))
      product_params[:images].each { |image| @product.images.attach(image) } if product_params[:images].present?
      redirect_to category_product_path(@product.category, @product), notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    redirect_to :root, notice: "Product was successfully destroyed."
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :price, :description, images: [],
                                                                    features_attributes: %i[id name value])
    end
end
