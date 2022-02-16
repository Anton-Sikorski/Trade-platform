class CreatePillows < ActiveRecord::Migration[6.1]
  def change
    create_table :pillows do |t|
      t.string :size
      t.string :color
      t.string :material
    end
  end
end
