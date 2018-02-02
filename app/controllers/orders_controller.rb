class OrdersController < ApplicationController
	def edit
		@order = Order.find(params[:id])
	end

	def update
		order = Order.find(params[:id])
		order.update(order_params)
		redirect_to user_path(order.user)
	end

	def destroy
		order = Order.find(params[:id])
		order.destroy
		redirect_to user_path(order.user)
	end

	private
		def order_params
			params.require(:order).permit(:user_id, :phone, :zip_code, :address, :firstname, :lastname, :delete_flag)
		end
end
