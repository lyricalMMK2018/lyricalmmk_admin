class ItemOrdersController < ApplicationController

	def update
		@item_order = ItemOrder.find(params[:id])
		@item_order.update(item_order_params)
		redirect_to edit_order_path(@item_order.order)
	end

	def destroy
		item_order = ItemOrder.find(params[:id])
		item_order.destroy
		redirect_to edit_order_path(item_order.order)
	end

	private
		def item_order_params
			params.require(:item_order).permit(:item_id, :order_id, :quantity, :delivery_status, :saved_price)
		end
end
