class CreateBeds < ActiveRecord::Migration[6.1]
  def change
    create_table :beds do |t|
      t.string :size
      t.string :color
      t.string :material
    end
  end
end
