class ChangeTypeIdToBigintAndAddFk < ActiveRecord::Migration[5.1]
  def change
  	change_column :items, :type_id, :bigint 
  	add_foreign_key :items, :types
  end
end
