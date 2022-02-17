class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.float :price
      t.string :title
      t.string :category
      t.timestamps
    end
  end
end
