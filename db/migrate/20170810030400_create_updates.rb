class CreateUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :updates do |t|
    	t.column :item_id, :integer
    	#t.column :item_item_name
    	t.column :active_stock, :integer
    	t.column :inactive_stock, :integer

      t.timestamps
    end
  end
end
