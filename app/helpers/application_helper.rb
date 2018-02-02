module ApplicationHelper
	def total_spent(x)
		total_spent = 0
		x.orders.each do |order|
			if order.delete_flag != true
				order.item_orders.each do |item_order|
					y = item_order.saved_price * item_order.quantity
					total_spent += y
				end
			end
		end
		return total_spent
	end

	def sub_total(x)
		sub_total = 0
		x.item_orders.each do |item_order|
			y = item_order.saved_price * item_order.quantity
			sub_total += y
		end
		return sub_total
	end
end
