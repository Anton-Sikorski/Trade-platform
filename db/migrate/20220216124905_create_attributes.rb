class CreateAttributes < ActiveRecord::Migration[6.1]
  def change
    create_table :attributes do |t|
      t.string :name
      t.references :product, null: false, foreign_key: true
    end
  end
end
