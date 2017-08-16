class RemoveInactivestockFromUpdates < ActiveRecord::Migration[5.1]
  def change
  	remove_column :updates, :inactive_stock
  	rename_column :updates, :active_stock, :stock
  end
end
