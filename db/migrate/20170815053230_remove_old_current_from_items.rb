class RemoveOldCurrentFromItems < ActiveRecord::Migration[5.1]
  def change
  	remove_column :items, :current?
  end
end
