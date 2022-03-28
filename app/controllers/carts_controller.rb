# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!
  include ReadCache

  def show
    cart_ids = ReadCache.redis.smembers current_user_cart
    @cart_products = Product.find(cart_ids)
  end

  def add
    ReadCache.redis.sadd current_user_cart, params[:product_id]
  end

  def remove
    ReadCache.redis.srem current_user_cart, params[:product_id]
  end

  private

    def current_user_cart
      "cart#{current_user.id}"
    end
end
