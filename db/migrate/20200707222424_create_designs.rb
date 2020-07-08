class CreateDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :designs do |t|
      t.string :name 
      t.string :material
      t.integer :size
    end
  end
end
