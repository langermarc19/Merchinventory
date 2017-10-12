class Update < ApplicationRecord
	belongs_to :item


	def stock_change  #assumes a single item_id
		i = Item.find(self.item_id) 
		updates = i.updates

		id_list = updates.map {|u| u.id} # creates array of update_id's in order, returns index of instance-update in array
		stock_list = updates.map{|u| u.stock} #creates stock list with same indices.

		m = id_list.index(self.id) #returns index of instance-update in arrary

		dstock = stock_list[m] - stock_list[m-1] #subtracts current item stock from

		return dstock
	end

end
