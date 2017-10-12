class AddNotNulltoStock < ActiveRecord::Migration[5.1]
  def change
  	change_column :updates, :stock, :integer, null: false
  end
end
