class Song < ApplicationRecord
	belongs_to :disk
	belongs_to :artist

	validates :disk_id, presence: true, numericality: true
	validates :song_name, presence: true, length: { maximum: 256 }
	validates :artist_id, presence: true, numericality: true
	validates :track_number, presence: true, numericality: true
	validates :song_length, presence: true
end
