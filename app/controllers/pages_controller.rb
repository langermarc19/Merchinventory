#require 'item.rb'

class PagesController < ApplicationController
	skip_before_action :verify_authenticity_token

	before_action :set_items_list, only: [:post_add_item, :post_update_stock, :update_stock, :inventory]
	before_action :set_item, only: [:update_stock, :post_update_stock]


	def post_add_item
		@item_name = params[:item_name]
		@size = params[:size]
		@price = params[:price]

		Item.add_item(@item_name, @size, @price) 
		render :inventory
	end

	def post_update_stock
		@id = params[:id]	
		@stock = params[:stock]
		item = Item.find(@id)

		if params[:deactivate]
			item.deactivate
		else
			item.update_stock(@stock)
		end

		render :inventory

	end

	def set_item 
		@item = Item.find(params[:id])
	end


	def set_items_list	
		@items_list = Item.where('is_active = true')
	end

	def refresh_after_gig
		SquareConnect.configure do |config|
  		config.access_token = 'sq0atp-7VpgwBK3i7uwA0Wx8x6JLg' 
  	    end


		api = SquareConnect::TransactionsApi.new
		begin_time = DateTime.now - (0.5) 
		end_time = DateTime.now






	end





end

