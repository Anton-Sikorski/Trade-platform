# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.float :price, null: false
      t.string :title, null: false
      t.string :description, null: false

      t.timestamps
    end

    add_reference :products, :store
  end
end
