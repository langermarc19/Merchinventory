class DropTableTypes < ActiveRecord::Migration[5.1]
  def change
  	remove_column :items, :type_id
  	drop_table :types
  end
end
