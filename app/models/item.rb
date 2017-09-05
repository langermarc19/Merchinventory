class Item < ApplicationRecord
	has_many :updates, dependent: :destroy
	belongs_to :types

	#before_action :set_update_list, only: [:set_updates_list]

	def self.add_item(item_name, size, price, is_active = true) 
		i = self.new
		u = Update.new

		i.item_name = item_name 
		i.size = size 
		i.price = price
		i.is_active = true
		i.save!  

		u.item_id = i.id 
		u.stock = 0
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
		u_list = Update.where({item_id: self.id})
		u_current = u_list.order('updated_at').last

		stock = u_current[:stock]
	end

	def update_stock(stock)
		u = Update.new 

		u.item_id = self.id
		u.stock = stock
		u.save!
	end

	def updates
		updates = Update.where({item_id: self.id})
	end

	def last_update
		u_list = Update.where({item_id: self.id})
		last_update = u_list.order('updated_at').last 
	end


	def prev_update(update_id)
		u_list = self.updates
		u_index = u_list.index(update_id)
		prev_update = updates_list[update_index - 1]
	end

	def item_url
		"/items/#{self.id}"
	end

	def delete_item 
	end











end
