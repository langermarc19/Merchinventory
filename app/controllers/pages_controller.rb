class PagesController < ApplicationController
	#respond_to :html, :json
	
	
	skip_before_action :verify_authenticity_token

	before_action :sort_items, only: [:details, :post_add_item, :post_update_stock, :update_stock, :items, :post_edit, :show_edit, :reactivate, :post_new_item]
	before_action :set_item, only: [:details, :edit, :post_edit, :reactivate, :view_updates]
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

		render :items 

	end

	def post_edit
		@id = params[:id]
		@item.item_name = params[:item_name]
		@item.size = params[:size]
		@item.price = params[:price]
		@item.save
		
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

	def details 
		@item.deactivate if params[:deactivate?]
		@item.destroy if params[:delete?]

		render :details
	end

	def post_new_item
		@item_name = params[:item_name]
		@size = params[:size]
		@price = params[:price]

		Item.add_item(@item_name, @size, @price) 
		render :items
	end

	def sort_items
		size_order = ["S","M","L","XL","Red","Blue","Yellow"]
		#default sort: by name, size 
		#if params[:by_name?]
		@items_list = Item.where('is_active = true').order(item_name: :asc)
		@items_list = @items_list.sort_by {|i| [i.item_name, size_order.index(i.size)]}

		#if params[:by_stock?]	
		#@items_list = Item.where('is_active = true').order(stock: :asc)


		#if params[:by_size?]
		#@items_list = Item.where('is_active = true').order(size: :asc)

	end












end

