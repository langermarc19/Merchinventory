class AddCurrentToItems < ActiveRecord::Migration[5.1]
  def change
  	add_column :items, :current, :boolean
  end
end
