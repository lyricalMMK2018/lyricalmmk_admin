class ItemsController < ApplicationController
	def index
		@items = Item.order(:updated_at).page(params[:page]).reverse_order
		# @q = Item.ransack(params[:q])
		# @items = @q.result(distinct: true)
	end

	def new
		@item = Item.new
	end

	def edit
		@item = Item.find(params[:id])
		@disk = Disk.new
		@song = Song.new
	end

	def create
		@item = Item.new(item_params)
		@item.admin_id = current_admin.id
		if @item.save
		redirect_to edit_item_path(@item)
		else
			render :new
		end
	end

	def destroy
		item = Item.find(params[:id])
		item.delete_flag = true
		item.save
		redirect_to items_path
	end

	def update
		item = Item.find(params[:id])
		item.update(item_params)
		redirect_to items_path
	end

	private
		def item_params
			params.require(:item).permit(:admin_id, :item_name, :artist_id, :stock, :genre_id, :price, :jacket_image, :label, :delete_flag)
		end
end
