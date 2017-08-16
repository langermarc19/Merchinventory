class RenameCurrentToIsActive < ActiveRecord::Migration[5.1]
  def change
  	rename_column :items, :current, :is_active
  end
end
