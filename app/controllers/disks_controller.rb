class DisksController < ApplicationController
	def create
		disk = Disk.new(disk_params)
		disk.save
		redirect_to edit_item_path(disk.item.id)
	end

	def update
		disk = Disk.find(params[:id])
		disk.update(disk_params)
		redirect_to edit_item_path(disk.item.id)
	end

	def destroy
		disk = Disk.find(params[:id])
		disk.destroy
		redirect_to edit_item_path(disk.item.id)
	end

	private
		def disk_params
			params.require(:disk).permit(:item_id, :disk_name, :disk_number)
		end
end
