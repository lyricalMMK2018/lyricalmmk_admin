class Item < ApplicationRecord
	belongs_to :admin
	belongs_to :artist
	has_many :carts
	has_many :item_orders
	has_many :disks
	has_many :songs, through: :disks

	attachment :jacket_image

	validates :item_name, presence: true, length: { maximum: 256 }
	validates :artist_id, presence: true, numericality: true
	validates :stock, presence: true, numericality: { less_than: 32768 }
	validates :genre_id, presence: true, numericality: true
	validates :price, presence: true, numericality: true
	validates :label, presence: true, length: { maximum: 256 }
end
