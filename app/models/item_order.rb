class ItemOrder < ApplicationRecord
	belongs_to :order
	belongs_to :item
	enum delivery_status: { Purchased: 0, ReadyForDelivery: 1, Departed: 2, Delivered: 3 }

	validates :item_id, presence: true
	validates :order_id, presence: true
	validates :quantity, presence: true, numericality: { greater_than: 0 }
	validates :saved_price, presence: true, numericality: true
end
