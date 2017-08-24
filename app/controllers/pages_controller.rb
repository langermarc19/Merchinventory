#require 'item.rb'

class PagesController < ApplicationController
	skip_before_action :verify_authenticity_token

	before_action :set_items_list, only: [:post_add_item, :post_update_stock, :update_stock, :inventory, :edit, :show_edit, :reactivate]
	before_action :set_item, only: [:update_stock, :post_update_stock, :edit, :show_edit, :reactivate, :view_updates]
	before_action :set_update_history, only: [:update_history]


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
		default_item = Item.find(@id)

		@item_S = Item.where({item_name: default_item.item_name, size: 'S'}).first
		@item_M = Item.where({item_name: default_item.item_name, size: 'M'}).first
		@item_L = Item.where({item_name: default_item.item_name, size: 'L'}).first
		@item_XL = Item.where({item_name: default_item.item_name, size: 'XL'}).first


		if params[:deactivate]
			default_item.deactivate
		end

		if params[:is_small]
			@item_S.update_stock(@stock)
		end

		if params[:is_medium]
			@item_M.update_stock(@stock)
		end

		if params[:is_large]
			@item_L.update_stock(@stock)
		end

		if params[:is_xl]
			@item_XL.update_stock(@stock)
		end

		render :inventory

	end

	def edit
		@id = params[:id]
		

		if params[:delete?] 
			@item.destroy

		else 
			@item.item_name = params[:item_name]
			@item.size = params[:size]
			@item.price = params[:price]
			@item.save
		end
		
		render :inventory	
	end


	def reactivate
		@item = Item.find(params[:id])
		@item.activate
		render :inventory
	end

	def update_history
	end

	def set_item 
		@item = Item.find(params[:id])
	end

	def set_items_list	
		@items_list = Item.where({is_active: true})
	end

	def set_update_history
		@update_history = Update.where({item_id: params[:id]})
	end

	def deactivated 
		@deac_items_list = Item.where({is_active: false})
	end










end

