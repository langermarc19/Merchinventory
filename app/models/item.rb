class Item < ApplicationRecord
	has_many :updates, dependent: :destroy

	def self.add_item(item_name, size, price, is_active = true) 
		i = self.new
		u = Update.new

		i.item_name = item_name 
		i.size = size 
		i.price = price
		i.is_active = true
		i.save!  

		u.item_id = i.id 
		u.active_stock = 0
		u.inactive_stock = 0
		u.save!
	end

	def deactivate
		self.is_active = false
		self.save
	end

	def activate 
		self.is_active = true
		self.save
	end

	def current_stock
		updates_list = Update.where(item_id: self.id)
		u_current = updates_list.order('updated_at').last
	end

	def update_stock(active_stock,inactive_stock)
		u = Update.new 

		u.item_id = self.id
		u.active_stock = active_stock
		u.inactive_stock = inactive_stock
		u.save!
	end

	def item_url
		"/items/#{self.id}"
	end

	def delete_item 
	end











end
