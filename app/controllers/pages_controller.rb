#require 'item.rb'

class PagesController < ApplicationController
	#respond_to :html, :json
	
	skip_before_action :verify_authenticity_token

	before_action :set_items_list, only: [:post_add_item, :post_update_stock, :update_stock, :items, :edit, :show_edit, :reactivate]
	before_action :set_item, only: [:edit, :show_edit, :reactivate, :view_updates]
	before_action :set_update_history, only: [:update_history]


	def post_add_item
		@item_name = params[:item_name]
		@size = params[:size]
		@price = params[:price]

		Item.add_item(@item_name, @size, @price) 
		render :items
	end

	def post_update_stock 
		ActionController::Parameters.permit_all_parameters = true
		params_hash = params.except(:controller, :action).to_h
		params_ary = params_hash.to_a

		params_ary.each do |element|
			item = Item.find(element[0]) 
			item.update_stock(element[1])
		end

			#if object[:deactivate] 
				#item.deactivate end


		render :items 

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
		
		render :items	
	end


	def reactivate
		@item = Item.find(params[:id])
		@item.activate
		render :items
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

