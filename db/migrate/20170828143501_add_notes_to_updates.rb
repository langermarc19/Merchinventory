class AddNotesToUpdates < ActiveRecord::Migration[5.1]
  def change
  	add_column :updates, :notes, :text
  end
end
