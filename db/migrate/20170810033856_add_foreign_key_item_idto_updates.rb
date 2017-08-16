class AddForeignKeyItemIdtoUpdates < ActiveRecord::Migration[5.1]
  def change
  	add_column :updates, :item_id, :bigint
  	add_foreign_key :updates, :items
  end
end
