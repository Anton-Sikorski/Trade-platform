class CreateAttributeValues < ActiveRecord::Migration[6.1]
  def change
    create_table :attribute_values do |t|
      t.string :value
      t.references :attribute, null: false, foreign_key: true

      t.timestamps
    end
  end
end
