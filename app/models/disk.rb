class Disk < ApplicationRecord
	belongs_to :item
	has_many :songs, dependent: :destroy

	validates :item_id, presence: true, numericality: true
	validates :disk_name, presence: true, length: { maximum: 256 }
	validates :disk_number, presence: true, numericality: true
end
