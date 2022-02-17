# frozen_string_literal: true

class CreateFeatureValues < ActiveRecord::Migration[6.1]
  def change
    create_table :feature_values do |t|
      t.string :value, null: false
      t.references :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
