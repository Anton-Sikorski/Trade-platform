# frozen_string_literal: true

class CreateFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :features do |t|
      t.string :name, null: false
      t.string :value, null: false
      t.references :product, null: false, foreign_key: true
    end
  end
end
