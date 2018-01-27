class DisksController < ApplicationController
	def create
		@disk = Disk.new(disk_params)
		render :edit
	end

	def update
		@disk = Disk.find(params[:id])
		@disk.update
		render :edit
	end

	def destroy
		@disk = Disk.find(params[:id])
		@disk.destroy
		render :edit
	end

	private
		def disk_params
			params.require(:disk).permit(:item_id, :disk_name, :disk_number)
		end
end
