class DeleteItemIdFromUpdates < ActiveRecord::Migration[5.1]
  def change
  	remove_column :updates, :item_id
  end
end
