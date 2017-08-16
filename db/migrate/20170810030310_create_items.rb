class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
    	t.column :item_name, :string
    	t.column :size, :string 
    	t.column :price, :float 

      t.timestamps
    end
  end
end