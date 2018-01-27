class ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def edit
		@item = Item.find(params[:id])
		@disks = @item.disks
		@disk = Disk.new
		@song = Song.new
	end

	def create
		item = Item.new(item_params)
		item.save
		redirect_to item_edit_path(:id)
	end

	def destroy
		item = Item.find(params[:id])
		item.delete_flag = true
		item.save
		redirect_to items_path
	end

	def update
		item = Item.find(params[:id])
		item.update
		redirect_to items_path
	end

	def search
		@q = Item.ransack(params[:q])
		@items = @q.result.(distinct: true)
		render :index
	end

	private
		def item_params
			params.require(:item).permit(:admin_id, :item_name, :artist_id, :stock, :genre_id, :price, :jacket_image_id, :label, :delete_flag)
		end
end
