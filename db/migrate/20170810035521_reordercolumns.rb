class Reordercolumns < ActiveRecord::Migration[5.1]
  def change
  	 change_column :updates, :item_id, :bigint, after: :id
  end
end
