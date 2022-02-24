# frozen_string_literal: true

class AddProductsToCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :category, null: false, foreign_key: true
  end
end
