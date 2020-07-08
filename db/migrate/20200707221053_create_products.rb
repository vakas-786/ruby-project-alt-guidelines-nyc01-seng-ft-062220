class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :printer_id 
      t.integer :design_id 
      t.string :material 
    end 
  end
end
